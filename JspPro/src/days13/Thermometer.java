package days13;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {
 
	
	private Map<String, Double> locationCelciusMap = new HashMap<>();
	
	
	public void setCelsius(String location, Double value) {
		locationCelciusMap.put(location, value);
	}
	
	
	public Double getCelsius(String location) {
		return locationCelciusMap.get(location);
	}
	
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if (celsius == null) {
			return null;
		}
		
		return celsius.doubleValue()*1.8 + 32.0;
	}
	
	public String getInfo() { // 온도계 변환 정보
		return "온도계 변환기 1.1";
		
	}
	
	
}
