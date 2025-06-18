/*========================================================================
	■■■ 객체 직렬화(Object Serialization) ■■■
=========================================================================*/

// ※ ○ ★ 『』 ⬛ ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩
// →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦


/// @see []()


/*
     ○ 객체 직렬화(Object Serialization)는
       메모리에 생성된 클래스 객체의 멤버 변수의 현재 상태를
       그대로 보존해서 파일에 저장하거나
       네트워크를 통해 전달할 수 있는 기능으로
       멤버 변수의 값을 보존한다거나
       다른 네트워크에 있는 호스트에 값을 보낼 경우 사용하게 된다.
       
       즉, 객체 직렬화는 내용물을 바이트 단위로 변환하여
       파일 또는 네트워크를 통해 송수신(스트림)이 가능하게
       만들어주는 것으로 이 때, 개체란 멤버 변수의 메모리만으로 구성된 것을 말한다.
       
       따라서, 메서드와 생성자는 객체 직렬화의 대상에서 제외된다.
     
        ※ 인스터스 생성시 멤버변수만 메모리에 올라간다.
           메서드는 사용할 때마다 메모리에 로딩된다 
     
     ○ 객체 직렬화(Object Serialization)의 장점
        객체 자체의 내용을 입출력 형식에 구애받지 않고
        객체를 파일에 저장함으로써 영속성을 제공할 수 있으며
        객체 자체를 네트워크를 통해 손쉽게 교환할 수 있게 된다.
        
        객체 직렬화는 자바 1.1 이후에 도입되었는데
        그 이유는 RMI 와 Bean 때문이다.
        RMI 는 원칙적으로 객체 통신을 지원해야 하기 때문에
        객체가 그대로(특정 상태를 유지한 체로) 이동할 수 있어야 한다.
        따라서 이를 지원하기 위해서는 객체 직렬화가 필수적이었다.
        
        또한, Bean은 설계 시 상태에 대한 정보를 저장할 때
        이 객체 직렬화를 사용하게 되면 편하고 안정적으로 객체 상태를 저장할 수 있다.
     
         ※ Bean(속성만 있는 클래스, VO, DTO에 활용됨) 때문에 객체 직렬화가 사용되고 있음.
         ※ 컴포넌트 - 
     
     ○ Serializable 인터페이스
        객체 직렬화를 수행하기 위해 먼저 객체 직렬화가 가능하도록
        java.io.Serializable 인터페이스를 구현해 주어야 한다.
        이 인터페이스는 객체 직렬화가 제공되어야 한다는 사실을
        JVM에 알려주는 역활을 수행한다.
        또한, Serializable 인터페이스는
        다른 인터페이스와 달리 구현해야 할 메서드가 없기 때문에
        단지 선언만 해주면 된다.
     
        형식)
          ①
            public class 클래스명 implements Serializable
            {
                 ...
            }
          
          ②
            Serializable 인터페이스를 구현한 후
            ObjectInputStream 클래스와 ObjectOutputStream 클래스를 이용하여
            객체 단위로 입출력을 수행하게 된다.
            
            ※ 멤버 변수가 static 으로 선언된 경우(즉, 클래스 변수일 경우)
               객체 직렬화의 대상에서 제외된다.
        
        ○ Object Stream
           java.io.ObjectInputStream
           ObjectInputStream 클래스는 ObjectOutputStream클래스에 의해
           파일에 저장되어 있는 객체나 네트워크를 통해 전달된 객체의
           직렬화를 해제하는 기능을 제공한다.
           
           단, java.io.Serializable 인터페이스와 java.io.Externalizable 인터페이스를
           지원해주는 객체에 대해서만 사용이 가능하다.
           
           즉, Serializable 인터페이스와  Externalizable 인터페이스를
           구현한 객체에서만 사용이 가능하다는 것이다.
           
           이 때, readOjbect() 메서드를 이용하여 스트림으로부터 직렬화된 객체를 읽을 수 있으며
           이렇게 읽은 객체는 배열, 문자열 또는 각 객체 등
           원래의 형(Type)으로 캐스팅 해 주어야 한다.
*/


/*

*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.Properties;
import java.util.Iterator;
import java.util.Hashtable;
import java.util.Enumeration;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test183  // extends Object
{
	
	public static void main(String[] args) throws Exception
	{
		
		/*
		  String appDir = System.getProperty("user.dir");
		  
		  // 테스트(확인)
		  System.out.println(appDir);
		  //--==>> C:\_Workspace\fullstack-flutter-dev_github\JavaStudy
		*/
		
		/*
		Properties prop = System.getProperties();
		//--  『Properties』 : Map 구조 → 키 : 값
		
		String key, value;
		Iterator<?> it = prop.keySet().iterator();
		while (it.hasNext())
		{
			key = (String)it.next();
			value = prop.getProperty(key);
			System.out.println("key : " + key + " - "  + value);
		}
		*/
		
		String appDir = System.getProperty("user.dir");
		//-- 시스템 자원으로부터 사용중인 디렉터리 정보 얻어오기
		
		// 파일 객체 생성
		File f0 = new File(appDir, "\\data\\test.ser");  // 확장자 『*.ser』
		//-- appDir → C:\_Workspace\fullstack-flutter-dev_github\JavaStudy
		//-- appDir 위치 기준으로 "\\data\\test.ser" 의 파일을 구성하겠다는 의미
		//   결과적으로 『C:\_Workspace\fullstack-flutter-dev_github\JavaStudy\data\test.ser』 구성
		
		// 테스트(확인)
		System.out.println(f0.getParentFile().exists());
		//--==>> false
		//--  『test.ser』파일이 만들어질 디렉터리 경로가 구성되어 있지 않다.
		//    즉,  『C:\_Workspace\fullstack-flutter-dev_github\JavaStudy\data\』이와 같은 디렉터리 구조가 만들어져 있지 않다.
		
		// ※ 『C:\_Workspace\fullstack-flutter-dev_github\JavaStudy』 경로에  『data』 디렉터리 생성 후 다시 확인
		
		// 테스트(확인)
		//System.out.println(f0.getParentFile().exists());
		//--==>> true
		
		// 『test.ser』 파일이 생성될 디텍터리 경로가 구성되어 있다면....
		//if (f0.getParentFile().exists())
		
		// 『test.ser』 파일이 생성될 디텍터리 경로가 구성되어 있지 않다면....
		if (!f0.getParentFile().exists())
		{
			// 디렉터리 구조 생성
			f0.getParentFile().mkdirs();
		}

		// 테스트(확인)
		//System.out.println(f0.getParentFile().exists());
		//--==>> true
		
		// Hashtable 자료구조 h1 인스턴스 생성
		Hashtable<String, String> h1 = new Hashtable<String, String>();
		
		// 생성한 h1 이라는 Hashtable 자료구조에 요소 추가
		h1.put("250123", "김한국-1");
		h1.put("250224", "김한국-2");
		h1.put("250325", "김한국-3");
		h1.put("250426", "김한국-4");
		h1.put("250527", "김한국-5");
		h1.put("250628", "김한국-6");
		
		// 테스트(확인)
		System.out.println(h1.get("250123"));
		//--==>> 김한국-1
		
		// 파일 전용 출력 스트림 생성(파일을 내보낼 수 있는 수도꼭지 열기)
		FileOutputStream fos = new FileOutputStream(f0);
		//-- 파일 전용 출력 스트림(물줄기)에
		//   f0라는 파일 객체를 띄우겠다.
		//  → InputStreamReader isr = new InputStreamReader(System.in);
		
		
		// 객체 전용 출력 스트림 생성(객체를 내보낼 수 있도록 처리)
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		//-- 객체 전용 출력 스트림(물줄기)으로
		//   fos라는 파일 전용 출력 스트림을 감싸겠다.
		//   → BufferedReader br = new BufferedReader(isr);

		// ※ 
		// File f0 = new File(appDir, "\\data\\test.ser");  // 확장자 『*.ser』
		// ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f0));
		//  → BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		/*
		     ※ ObjectOutputStream 클래스는
		        객체들을 출력하는 기능을 제공하는 클래스로
		        출력 스트림에 출력하기 전에
		        내부적으로 객체 직렬화를 수행하게 된다.
		        자바 기본형 데이터 또는 객체들을
		        파일에 저장하거나 네트워크를 통해 전달하기 위해
		        전달할 객체를 직렬화 하는 기능을 제공하는 것이다.
		*/
		
		// 생성된 스트림(물줄기)에 내보낼 객체를 기록(→ 종이배 띄우기)
		oos.writeObject(h1);
		//-- 앞서 다루었던 Test179.java 파일의 『out.write(ch);』 와 같은 개녕의 구문
		
		// 객체 전용 리소스 반납
		oos.close();
		//-- ObjectOutputStream 리소스 반납
		
		// 파일 전용 리소스 반납
		fos.close();
		//-- FileOutputStream 리소스 반납
		
		// 여기까지 수행하면 () 내보내기 끝~!!!
		//---------------------------------------------------
		System.out.println("-------------[파일 쓰기]--------------------------");
		
		// (객체를 직렬화하여 내보낸 파일) 읽어들이기 시작~!!!
		
		
		// f0 파일 객체가 존재한다면...
		if (f0.exists())
		{
			// 업무 수행
			
			
			// f0 파일을 파일 입력 스트림(fis, FileInputStream)으로 읽어들이고..
			FileInputStream fis = new FileInputStream(f0);
			
			// fis 파일 입력 스트림으로부터
			// 객체 입력 스트림(ois, ObjectInputStream)을 얻어내기
			ObjectInputStream ois = new ObjectInputStream(fis);
			//-- ObjectInputStream 으로 FileInputStream 감싸기
			
			// 객체 입력 스트림(ois, ObjectInputStream)으로부터 읽어들인 객체(Object)를
			// 원래의 형(Type)으로 캐스팅하여 h2 라는 Hashtable 자료구조에 담아내기
			//Object obj = ois.readObject();
			Hashtable h2 = (Hashtable)ois.readObject();
			
			ois.close();
			//-- ois, ObjectInputStream 리소스 반납
			
			fis.close();
			//-- fis, FileInputStream 리소스 반납
			
			// 여기까지 수행하면 읽어들이는 작업 끝~!!!!
			//-------------------------------------------------------------
			System.out.println("-------------[파일 읽기]--------------------------");
			
			// 읽어들이 h2 객체의 내용 확인
			
			String key, value;
			
			Enumeration e = h2.keys();
			while (e.hasMoreElements())
			{
				key = (String)e.nextElement();
				// h2 라는 Hashtable 자료구조를 대상으로 key를 읽어들이는 과정
				
				// 테스트(확인)
				//System.out.println(key);
				//-- 실행 결과
				/*
				  250527
				  250224
				  250426
				  250628
				  250123
				  250325
				*/
				
				value = (String)h2.get(key);
				//-- h2 라는 Hashtable 자료구조를 대상으로
				//   읽어들인 key를 활용하여 value를 얻어내는 과정
				
				System.out.println(key + " → " + value);
				//-- 실행 결과
				/*
				  250527 → 김한국-5
				  250224 → 김한국-2
				  250426 → 김한국-4
				  250628 → 김한국-6
				  250123 → 김한국-1
				  250325 → 김한국-3
				*/
			}
			
		} else {
			System.out.println("읽어들일 파일이 존재하지 않습니다~!!!");
		}
		
	}
}