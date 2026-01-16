public class StringArrayTest { 
    
     public static List<String> generateStringArray(Integer n) {
         
         List<String> theList = new List<String>();
         
         for(Integer i=0; i<n; i++){
             theList.add('Test ' + i);
         }
         
         return theList; 
     }
}