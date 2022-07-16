package springboard.util;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class EnvFileReader {
	
	public static String getValue(String envFile, String keyName) {
		
		//스프링 컨텍스트 생성
		ConfigurableApplicationContext ctx = 
				new GenericXmlApplicationContext();
		//Environment 객체생성
		ConfigurableEnvironment env = ctx.getEnvironment();
		//외부파일로 생성된 property 소스 파일을 읽을 준비를 한다.
		MutablePropertySources propertySources = 
			env.getPropertySources();
				
		String envStr = "";
		try {
			//매개변수를 통해 전달된 파일경로 및 속성 읽어오기
			String envPath = "classpath:"+envFile;			
			propertySources.addLast(
				new ResourcePropertySource(envPath));
			envStr = env.getProperty(keyName);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return envStr;
	}
}
