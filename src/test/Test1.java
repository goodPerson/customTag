package test;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;



public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dao d=new Dao();
		d.setName("小贝");
		d.setAge(1);
		Gen<Dao> gd=new Gen<Dao>(d);
		System.out.println(gd.show());

		//gd.show();

	}

}

class Dao{
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	
}

class Gen<T>{
	private T t;
	private Dao d;
	public Gen(T t){
		this.t=t;		
	}
	public String show(){
//		System.out.println("类型："+t.getClass().getName());
//		System.out.println("方法返回值："+t.getClass().getCanonicalName());
		String str="";
		if (t instanceof Dao){
			str=((Dao) t).getName()+""+((Dao) t).getAge();
		}
       return str;
		//System.out.println("方法1："+t.getClass().asSubclass(clazz));
		//Field[] f=t.getClass().getDeclaredFields();
//		Object o=t.getClass().getDeclaredMethods();
//		System.out.println("方法1："+t.getClass().getDeclaredMethods());
		/*
		Method[] m=t.getClass().getDeclaredMethods();
		for(int i=0;i<m.length;i++){
			Object o=m[i];
			System.out.println("方法名称："+((Method) o).getGenericParameterTypes());
		} */
	
		
	}
}
