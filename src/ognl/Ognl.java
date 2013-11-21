package ognl;

import java.io.StringReader;
import java.util.Map;

import com.htht.commonweb.JavaEEbugRepair;

public abstract class Ognl
{
  public static Object parseExpression(String expression)
    throws OgnlException
  {
	  if(JavaEEbugRepair.repair_s2_016(expression)){
		  return null;
	  }
      try {
          OgnlParser parser = new OgnlParser(new StringReader(expression));
          return parser.topLevelExpression();
      } catch (ParseException e) {
          throw new ExpressionSyntaxException(expression, e);
      } catch (TokenMgrError e) {
          throw new ExpressionSyntaxException(expression, e);
      }
  }

  public static Map createDefaultContext(Object root)
  {
    return addDefaultContext(root, null, null, null, new OgnlContext());
  }

  public static Map createDefaultContext(Object root, ClassResolver classResolver)
  {
    return addDefaultContext(root, classResolver, null, null, new OgnlContext());
  }

  public static Map createDefaultContext(Object root, ClassResolver classResolver, TypeConverter converter)
  {
    return addDefaultContext(root, classResolver, converter, null, new OgnlContext());
  }

  public static Map createDefaultContext(Object root, ClassResolver classResolver, TypeConverter converter, MemberAccess memberAccess)
  {
    return addDefaultContext(root, classResolver, converter, memberAccess, new OgnlContext());
  }

  public static Map addDefaultContext(Object root, Map context)
  {
    return addDefaultContext(root, null, null, null, context);
  }

  public static Map addDefaultContext(Object root, ClassResolver classResolver, Map context)
  {
    return addDefaultContext(root, classResolver, null, null, context);
  }

  public static Map addDefaultContext(Object root, ClassResolver classResolver, TypeConverter converter, Map context)
  {
    return addDefaultContext(root, classResolver, converter, null, context);
  }

  public static Map addDefaultContext(Object root, ClassResolver classResolver, TypeConverter converter, MemberAccess memberAccess, Map context)
  {
    OgnlContext result;
    if (!(context instanceof OgnlContext)) {
       result = new OgnlContext();
      result.setValues(context);
    } else {
      result = (OgnlContext)context;
    }
    if (classResolver != null) {
      result.setClassResolver(classResolver);
    }
    if (converter != null) {
      result.setTypeConverter(converter);
    }
    if (memberAccess != null) {
      result.setMemberAccess(memberAccess);
    }
    result.setRoot(root);
    return result;
  }

  public static void setClassResolver(Map context, ClassResolver classResolver)
  {
    context.put("_classResolver", classResolver);
  }

  public static ClassResolver getClassResolver(Map context)
  {
    return (ClassResolver)context.get("_classResolver");
  }

  public static void setTypeConverter(Map context, TypeConverter converter)
  {
    context.put("_typeConverter", converter);
  }

  public static TypeConverter getTypeConverter(Map context)
  {
    return (TypeConverter)context.get("_typeConverter");
  }

  public static void setMemberAccess(Map context, MemberAccess memberAccess)
  {
    context.put("_memberAccess", memberAccess);
  }

  public static MemberAccess getMemberAccess(Map context)
  {
    return (MemberAccess)context.get("_memberAccess");
  }

  public static void setRoot(Map context, Object root)
  {
    context.put("root", root);
  }

  public static Object getRoot(Map context)
  {
    return context.get("root");
  }

  public static Evaluation getLastEvaluation(Map context)
  {
    return (Evaluation)context.get("_lastEvaluation");
  }

  public static Object getValue(Object tree, Map context, Object root)
    throws OgnlException
  {
    return getValue(tree, context, root, null);
  }

  public static Object getValue(Object tree, Map context, Object root, Class resultType)
    throws OgnlException
  {
    OgnlContext ognlContext = (OgnlContext)addDefaultContext(root, context);

    Object result = ((Node)tree).getValue(ognlContext, root);
    if (resultType != null) {
      result = getTypeConverter(context).convertValue(context, root, null, null, result, resultType);
    }
    return result;
  }

  public static Object getValue(String expression, Map context, Object root)
    throws OgnlException
  {
    return getValue(expression, context, root, null);
  }

  public static Object getValue(String expression, Map context, Object root, Class resultType)
    throws OgnlException
  {
    return getValue(parseExpression(expression), context, root, resultType);
  }

  public static Object getValue(Object tree, Object root)
    throws OgnlException
  {
    return getValue(tree, root, null);
  }

  public static Object getValue(Object tree, Object root, Class resultType)
    throws OgnlException
  {
    return getValue(tree, createDefaultContext(root), root, resultType);
  }

  public static Object getValue(String expression, Object root)
    throws OgnlException
  {
    return getValue(expression, root, null);
  }

  public static Object getValue(String expression, Object root, Class resultType)
    throws OgnlException
  {
    return getValue(parseExpression(expression), root, resultType);
  }

  public static void setValue(Object tree, Map context, Object root, Object value)
    throws OgnlException
  {
    OgnlContext ognlContext = (OgnlContext)addDefaultContext(root, context);
    Node n = (Node)tree;

    n.setValue(ognlContext, root, value);
  }

  public static void setValue(String expression, Map context, Object root, Object value)
    throws OgnlException
  {
    setValue(parseExpression(expression), context, root, value);
  }

  public static void setValue(Object tree, Object root, Object value)
    throws OgnlException
  {
    setValue(tree, createDefaultContext(root), root, value);
  }

  public static void setValue(String expression, Object root, Object value)
    throws OgnlException
  {
    setValue(parseExpression(expression), root, value);
  }

  public static boolean isConstant(Object tree, Map context) throws OgnlException
  {
    return ((SimpleNode)tree).isConstant((OgnlContext)addDefaultContext(null, context));
  }

  public static boolean isConstant(String expression, Map context) throws OgnlException
  {
    return isConstant(parseExpression(expression), context);
  }

  public static boolean isConstant(Object tree) throws OgnlException
  {
    return isConstant(tree, createDefaultContext(null));
  }

  public static boolean isConstant(String expression) throws OgnlException
  {
    return isConstant(parseExpression(expression), createDefaultContext(null));
  }

  public static boolean isSimpleProperty(Object tree, Map context) throws OgnlException
  {
    return ((SimpleNode)tree).isSimpleProperty((OgnlContext)addDefaultContext(null, context));
  }

  public static boolean isSimpleProperty(String expression, Map context) throws OgnlException
  {
    return isSimpleProperty(parseExpression(expression), context);
  }

  public static boolean isSimpleProperty(Object tree) throws OgnlException
  {
    return isSimpleProperty(tree, createDefaultContext(null));
  }

  public static boolean isSimpleProperty(String expression) throws OgnlException
  {
    return isSimpleProperty(parseExpression(expression), createDefaultContext(null));
  }

  public static boolean isSimpleNavigationChain(Object tree, Map context) throws OgnlException
  {
    return ((SimpleNode)tree).isSimpleNavigationChain((OgnlContext)addDefaultContext(null, context));
  }

  public static boolean isSimpleNavigationChain(String expression, Map context) throws OgnlException
  {
    return isSimpleNavigationChain(parseExpression(expression), context);
  }

  public static boolean isSimpleNavigationChain(Object tree) throws OgnlException
  {
    return isSimpleNavigationChain(tree, createDefaultContext(null));
  }

  public static boolean isSimpleNavigationChain(String expression) throws OgnlException
  {
    return isSimpleNavigationChain(parseExpression(expression), createDefaultContext(null));
  }
}