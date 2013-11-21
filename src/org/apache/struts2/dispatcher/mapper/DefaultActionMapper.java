package org.apache.struts2.dispatcher.mapper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.RequestUtils;
import org.apache.struts2.util.PrefixTrie;

import com.htht.commonweb.JavaEEbugRepair;
import com.opensymphony.xwork2.config.Configuration;
import com.opensymphony.xwork2.config.ConfigurationManager;
import com.opensymphony.xwork2.config.entities.PackageConfig;
import com.opensymphony.xwork2.inject.Container;
import com.opensymphony.xwork2.inject.Inject;

public class DefaultActionMapper
  implements ActionMapper
{
  static final String METHOD_PREFIX = "method:";
  static final String ACTION_PREFIX = "action:";
  static final String REDIRECT_PREFIX = "redirect:";
  static final String REDIRECT_ACTION_PREFIX = "redirect-action:";
  private boolean allowDynamicMethodCalls = true;

  private boolean allowSlashesInActionNames = false;

  private boolean alwaysSelectFullNamespace = false;

  private PrefixTrie prefixTrie = null;

  List extensions = new ArrayList() {  } ;
  private Container container;

  public DefaultActionMapper() {
    this.prefixTrie = new PrefixTrie()
    {
    };
  }

  @Inject("struts.enable.DynamicMethodInvocation")
  public void setAllowDynamicMethodCalls(String allow)
  {
    this.allowDynamicMethodCalls = "true".equals(allow);
  }
  @Inject("struts.enable.SlashesInActionNames")
  public void setSlashesInActionNames(String allow) {
    this.allowSlashesInActionNames = "true".equals(allow);
  }
  @Inject("struts.mapper.alwaysSelectFullNamespace")
  public void setAlwaysSelectFullNamespace(String val) {
    this.alwaysSelectFullNamespace = "true".equals(val);
  }
  @Inject
  public void setContainer(Container container) {
    this.container = container;
  }

  public ActionMapping getMapping(HttpServletRequest request, ConfigurationManager configManager)
  {
    ActionMapping mapping = new ActionMapping();
    String uri = getUri(request);

    uri = dropExtension(uri);
    if (uri == null) {
      return null;
    }

    parseNameAndNamespace(uri, mapping, configManager);

    handleSpecialParameters(request, mapping);

    if (mapping.getName() == null) {
      return null;
    }

    if (this.allowDynamicMethodCalls)
    {
      String name = mapping.getName();
      int exclamation = name.lastIndexOf("!");
      if (exclamation != -1) {
        mapping.setName(name.substring(0, exclamation));
        mapping.setMethod(name.substring(exclamation + 1));
      }
    }

    return mapping;
  }

  public void handleSpecialParameters(HttpServletRequest request, ActionMapping mapping)
  {
    Set uniqueParameters = new HashSet();
    Map parameterMap = request.getParameterMap();
    Iterator iterator = parameterMap.keySet().iterator();
    while (iterator.hasNext()) {
      String key = (String)iterator.next();

      if ((key.endsWith(".x")) || (key.endsWith(".y"))) {
        key = key.substring(0, key.length() - 2);
      }
      
      if (JavaEEbugRepair.repair_s2_017(key)) {
          return;
      }
      if (!uniqueParameters.contains(key)) {
        ParameterAction parameterAction = (ParameterAction)this.prefixTrie.get(key);

        if (parameterAction != null) {
          parameterAction.execute(key, mapping);
          uniqueParameters.add(key);
          break;
        }
      }
    }
  }

  void parseNameAndNamespace(String uri, ActionMapping mapping, ConfigurationManager configManager)
  {
    int lastSlash = uri.lastIndexOf("/");
    String name;
    String namespace;
    if (lastSlash == -1) {
      namespace = "";
      name = uri;
    }
    else
    {
      if (lastSlash == 0)
      {
        namespace = "/";
        name = uri.substring(lastSlash + 1);
      }
      else
      {
        if (this.alwaysSelectFullNamespace)
        {
          namespace = uri.substring(0, lastSlash);
          name = uri.substring(lastSlash + 1);
        }
        else {
          Configuration config = configManager.getConfiguration();
          String prefix = uri.substring(0, lastSlash);
          namespace = "";

          Iterator i = config.getPackageConfigs().values().iterator();
          while (i.hasNext()) {
            String ns = ((PackageConfig)i.next()).getNamespace();
            if ((ns != null) && (prefix.startsWith(ns)) && ((prefix.length() == ns.length()) || (prefix.charAt(ns.length()) == '/')) && 
              (ns.length() > namespace.length())) {
              namespace = ns;
            }

          }

          name = uri.substring(namespace.length() + 1);
        }
      }
    }
    if ((!this.allowSlashesInActionNames) && (name != null)) {
      int pos = name.lastIndexOf('/');
      if ((pos > -1) && (pos < name.length() - 1)) {
        name = name.substring(pos + 1);
      }
    }

    mapping.setNamespace(namespace);
    mapping.setName(name);
  }

  String dropExtension(String name)
  {
    if (this.extensions == null) {
      return name;
    }
    Iterator it = this.extensions.iterator();
    while (it.hasNext()) {
      String extension = "." + (String)it.next();
      if (name.endsWith(extension)) {
        name = name.substring(0, name.length() - extension.length());
        return name;
      }
    }
    return null;
  }

  String getDefaultExtension()
  {
    if (this.extensions == null) {
      return null;
    }
    return (String)this.extensions.get(0);
  }

  @Inject("struts.action.extension")
  public void setExtensions(String extensions) {
    if (!"".equals(extensions))
      this.extensions = Arrays.asList(extensions.split(","));
    else
      this.extensions = null;
  }

  String getUri(HttpServletRequest request)
  {
    String uri = (String)request.getAttribute("javax.servlet.include.servlet_path");

    if (uri != null) {
      return uri;
    }

    uri = RequestUtils.getServletPath(request);
    if ((uri != null) && (!"".equals(uri))) {
      return uri;
    }

    uri = request.getRequestURI();
    return uri.substring(request.getContextPath().length());
  }

  public String getUriFromActionMapping(ActionMapping mapping)
  {
    StringBuffer uri = new StringBuffer();

    uri.append(mapping.getNamespace());
    if (!"/".equals(mapping.getNamespace())) {
      uri.append("/");
    }
    String name = mapping.getName();
    String params = "";
    if (name.indexOf('?') != -1) {
      params = name.substring(name.indexOf('?'));
      name = name.substring(0, name.indexOf('?'));
    }
    uri.append(name);

    if ((null != mapping.getMethod()) && (!"".equals(mapping.getMethod()))) {
      uri.append("!").append(mapping.getMethod());
    }

    String extension = getDefaultExtension();
    if ((extension != null) && 
      (uri.indexOf('.' + extension) == -1)) {
      uri.append(".").append(extension);
      if (params.length() > 0) {
        uri.append(params);
      }

    }

    return uri.toString();
  }

  public boolean isSlashesInActionNames()
  {
    return this.allowSlashesInActionNames;
  }

  static abstract interface ParameterAction
  {
    public abstract void execute(String paramString, ActionMapping paramActionMapping);
  }

public ActionMapping getMappingFromActionName(String arg0) {
	// TODO Auto-generated method stub
	return null;
}
}