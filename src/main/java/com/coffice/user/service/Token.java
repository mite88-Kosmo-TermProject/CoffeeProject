package com.coffice.user.service;

public class Token {

	
	String imp_key 		=	URLEncoder.encode('rest  API KEY', "UTF-8");

	String imp_secret	=	URLEncoder.encode('rest Secret KEY', "UTF-8");

	JSONObject json = new JSONObject();

	json.put("imp_key", imp_key);

	json.put("imp_secret", imp_secret);

	String _token = getToken(request, response, json, requestURL); 



	public String getToken(HttpServletRequest request
	
			,HttpServletResponse response
	
			,JSONObject json
	
			,String requestURL) throws Exception{
	
		
	
		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 
	
		String _token = "";
	
		try{
	
			String requestString = "";
	
			URL url = new URL(requestURL);
	
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	
			connection.setDoOutput(true); 				
	
			connection.setInstanceFollowRedirects(false);  
	
			connection.setRequestMethod("POST");
	
			connection.setRequestProperty("Content-Type", "application/json");
	
			OutputStream os= connection.getOutputStream();
	
			os.write(json.toString().getBytes());
	
			connection.connect();
	
			StringBuilder sb = new StringBuilder(); 
	
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
	
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
	
			
	
				String line = null;  
	
				while ((line = br.readLine()) != null) {  
	
					sb.append(line + "\n");  
	
				}
	
				br.close();
	
				requestString = sb.toString();
	
			
	
			}
	
			os.flush();
	
			connection.disconnect();
	
			
	
			JSONParser jsonParser = new JSONParser();
	
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
	
			
	
			if((Long)jsonObj.get("code")  == 0){
	
				JSONObject getToken = (JSONObject) jsonObj.get("response");
	
				System.out.println("getToken==>>"+getToken.get("access_token") );
	
				_token = (String)getToken.get("access_token");
	
			}
	
			
	
		}catch(Exception e){
	
			e.printStackTrace();
	
			_token = "";
	
		}
	
		return _token;

	}
}