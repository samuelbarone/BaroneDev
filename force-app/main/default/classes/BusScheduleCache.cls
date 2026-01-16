public class BusScheduleCache {

    private Cache.OrgPartition part;
    
  public BusScheduleCache() { 
    part = Cache.Org.getPartition('local.BusSchedule'); 
  } 
    
    public void putSchedule(String busLine, Time[] schedule){ 
        part.put(busLine, schedule);
    }
    
    public Time[] getSchedule(String busLine){
        
         Time[] arr = (Time[])part.get(busLine);
     
        if (arr != null) {
            return  (Time[])part.get(busLine); 
        } else {
            
            List<Time> newArr = new List<Time>();
            newArr.add(Time.newInstance(8,0,0,0));
            newArr.add(Time.newInstance(17, 0, 0, 0));
            
            return newArr;
            
        } 
        
    }
    
}