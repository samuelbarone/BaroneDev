public class ParkLocator {
   public static List<String> country (String c) {
        ParkService.ParksImplPort proxy = 
            new ParkService.ParksImplPort();
        return proxy.byCountry(c);
    }
}