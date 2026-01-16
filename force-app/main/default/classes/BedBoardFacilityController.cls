public with sharing class BedBoardFacilityController {
 
    @AuraEnabled
    public static BedAvailability__c getBedBoardFacility(string facilityName)
    { 
        string ep = 'http://bedboardapi.contactaac.com/api/v1/bedavailability/' + 
            			EncodingUtil.urlEncode(facilityName, 'UTF-8').replaceAll('\\+','%20');            
        //system.debug(ep);
        
        Map<string, string> headerMap = new Map<string, string>();
        headerMap.put('Authorization','api-key ab9506cd6a444a91bb51dd7a103cc80a:T9yUb3C8dYtycz6p9C7YbMm0BScOcEP79gcg+vowrco='); 
        headerMap.put('Content-Type','application/json');  
        
        HttpResponse res = getResponse('GET',ep,'',headerMap); 
       
        BedAvailability__c ba;
        if(res.getStatusCode() == 200)
        { 
            if(res.getBody() != 'null')
            {
                string json = res.getBody();
                //system.debug(json);
                BedBoardFacilityResponse response = (BedBoardFacilityResponse)System.JSON.deserialize(json, BedBoardFacilityResponse.class);
                     
                ba = new BedAvailability__c();
                ba.FacilityId__c = response.FacilityId;
                ba.FacilityName__c = response.FacilityName;
                ba.Location__c = response.Location; 
                ba.TotalBeds__c = response.TotalBeds;
                ba.Booked__c = response.Booked;
                ba.UsedBeds__c = response.UsedBeds;
                ba.InactiveBeds__c = response.InactiveBeds;
                
                ba.TotalDetoxMaleBeds__c = response.TotalDetoxMaleBeds; 
                ba.MaleDetoxBedsAvailable__c = response.MaleDetoxBedsAvailable;
                ba.MaleBedsUsed__c = response.MaleBedsUsed;
                ba.MaleTotalBeds__c = response.MaleTotalBeds;
                
                ba.TotalDetoxFemaleBeds__c = response.TotalDetoxFemaleBeds; 
                ba.FemaleDetoxBedsAvailable__c = response.FemaleDetoxBedsAvailable;
                ba.FemaleBedsUsed__c = response.FemaleBedsUsed;
                ba.FemaleTotalBeds__c = response.FemaleTotalBeds;
                
                ba.Day1departures__c = response.Day1departures;
                ba.Day1arrivals__c = response.Day1arrivals;
                ba.TodayAvailabilityDetoxMale__c = response.TodayAvailabilityDetoxMale;
                ba.TodayAvailabilityDetoxFemale__c = response.TodayAvailabilityDetoxFemale; 
                ba.TodayAvailabilityMale__c = response.TodayAvailabilityMale;
                ba.TodayAvailabilityFemale__c = response.TodayAvailabilityFemale;
                
                ba.Day2departures__c = response.Day2departures;
                ba.Day2arrivals__c = response.Day2arrivals;
                ba.TomorrowAvailabilityDetoxMale__c = response.TomorrowAvailabilityDetoxMale;
                ba.TomorrowAvailabilityDetoxFemale__c = response.TomorrowAvailabilityDetoxFemale; 
                ba.TomorrowAvailabilityMale__c = response.TomorrowAvailabilityMale;
                ba.TomorrowAvailabilityFemale__c = response.TomorrowAvailabilityFemale;
                
                ba.Day3departures__c = response.Day3departures;
                ba.Day3arrivals__c = response.Day3arrivals;
                ba.DayThreeAvailabilityDetoxMale__c = response.DayThreeAvailabilityDetoxMale;
                ba.DayThreeAvailabilityDetoxFemale__c = response.DayThreeAvailabilityDetoxFemale; 
                ba.DayThreeAvailabilityMale__c = response.DayThreeAvailabilityMale;
                ba.DayThreeAvailabilityFemale__c = response.DayThreeAvailabilityFemale;
            }
        }
        else
        {
            system.debug(res);
            
           ba = null;
        }
        
        return ba;
    } 
    
    private static HttpResponse getResponse(string httpMethod, string endPoint, string body, Map<string, string> headers)
    {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod(httpMethod);
        req.setEndpoint(endPoint);
        req.setTimeout(90000);
        
      // system.debug(headers);
         
        for(string h : headers.keySet())
        { 
            req.setHeader(h, headers.get(h));
            // system.debug('@@@@@@ ' + h +  ' ' + headers.get(h));
        }
       
       // system.debug('body: ' + body);

        if(string.isNotBlank(body) && string.isNotEmpty(body))
            req.setBody(body);
        
       // system.debug('****** Authorization: ' + req.getHeader('Authorization'));
       // system.debug('****** Content-Type : ' + req.getHeader('Content-Type')); 
       // system.debug('****** ' + req);
         
        Http h = new Http();
        return h.send(req); 
    }

public class Arrival
{
  private String clientId;  
  private String clientName; 
  private String caseStatus; 
  private String clientGender; 
  private String caseNumber; 
  private String arrivalDate; 
  private String arrivalTime; 
  private String arrivalTimeZone;   
  private String arrivalTimeAmPm; 
  private boolean arrivingToday; 
  private String facilityId; 
  private String facility; 
  private String detoxFacilityId; 
  private String detoxFacility; 
  private String facilityAdmissionDate; 
  private String treatmentConsultant; 
  private String bdmm; 
  private String bdRep; 
  private String referralSource; 
  private String methodOfPayment; 
  private double cashCollected; 
  private String colorCode; 
  private String transportationStatus; 
  private boolean transportationReservedForLocalReferral; 
  private String departingAirline; 
  private String departingFlightNumber; 
  private String departingCity; 
  private String departingState; 
  private String departureDate; 
  private String departureTime; 
  private String departureTimeAmPm; 
  private String departureTimeZone; 
  private String demographics; 
  private boolean detoxOnly; 
  private boolean outpatientOnly; 
  private String createdBy; 
  private String createdDate; 
  private String bedBoardFacility; 
  private String bedBoardFacilityId; 
}
public class WorkList
{
  public String business; 
  public String location; 
  public String facility; 
  public String facilitySalesforceName; 
  public String facilitySalesforceId; 
  public String building; 
  public String bed; 
  public String room; 
  public Integer roomId; 
  public String client; 
  public String salesforceId; 
  public String gender; 
  public String admitDate; 
  public String program; 
  public String programCode; 
  public Integer lengthOfStay; 
  public boolean isAvailable; 
  public boolean dischargingToday; 
  public String edod; 
  public object detoxCompletionDate; 
  public String roomGender; 
  public Integer roomBeds;   
  public boolean isReserved; 
  public boolean isSpecial; 
  public boolean isOverflow; 
  public boolean detoxOnly; 
  public boolean isInactive; 
  public List<Arrival> arrivals; 
  public List<object> waitingList; 
}

public class BedBoardFacilityResponse
{
  public String facilityId; 
  public String facilityName;  
  public String location;  
  private List<WorkList> workList;  
  public Integer totalBeds; 
  public Integer usedBeds;  
  public Integer availableBeds; 
  public Integer booked; 
  public Integer reservedBeds; 
  public Integer inactiveBeds;
  public Integer dischargingToday; 
  public Integer arrivalsToday; 
  public Integer admitsToday; 
  public Integer overflowBeds; 
  public Integer specialBeds;  
  public Integer totalDetoxBeds; 
  public Integer totalDetoxBedsUsed; 
  public Integer totalDetoxBedsAvailable; 
  public Integer maleTotalBeds; 
  public Integer maleBedsUsed;  
  public Integer maleBedsAvailable; 
  public Integer totalDetoxMaleBeds; 
  public Integer maleDetoxBedsAvailable; 
  public Integer maleSpecialBedsAvailable; 
  public Integer femaleTotalBeds; 
  public Integer femaleBedsUsed; 
  public Integer femaleBedsAvailable; 
  public Integer totalDetoxFemaleBeds; 
  public Integer femaleDetoxBedsAvailable; 
  public Integer femaleSpecialBedsAvailable; 
  public Integer flexTotalBeds; 
  public Integer flexBedsUsed; 
  public Integer flexBedsAvailable; 
  public Integer totalDetoxFlexBeds; 
  public Integer flexDetoxBedsAvailable; 
  public Integer day1Beds; 
  public Integer day1arrivals; 
  public Integer day1arrivalsMale; 
  public Integer day1arrivalsFemale; 
  public Integer day1departures; 
  public Integer day1departuresMale; 
  public Integer day1departuresFemale; 
  public Integer day2Beds; 
  public Integer day2arrivals; 
  public Integer day2arrivalsMale; 
  public Integer day2arrivalsFemale; 
  public Integer day2departures; 
  public Integer day2departuresMale;    
  public Integer day2departuresFemale; 
  public Integer day3Beds; 
  public Integer day3arrivals; 
  public Integer day3arrivalsMale; 
  public Integer day3arrivalsFemale; 
  public Integer day3departures; 
  public Integer day3departuresMale; 
  public Integer day3departuresFemale; 
  public Integer day4Beds; 
  public Integer day4arrivals; 
  public Integer day4arrivalsMale; 
  public Integer day4arrivalsFemale; 
  public Integer day4departures; 
  public Integer day4departuresMale; 
  public Integer day4departuresFemale; 
  public Integer waitingClients; 
  public Integer waitingMales; 
  public Integer waitingFemales;   
  public Integer todayAvailability; 
  public Integer todayAvailabilityMale; 
  public Integer todayAvailabilityFemale; 
  public Integer todayAvailabilityDetox; 
  public Integer todayAvailabilityDetoxMale; 
  public Integer todayAvailabilityDetoxFemale; 
  public Integer tomorrowAvailability; 
  public Integer tomorrowAvailabilityMale; 
  public Integer tomorrowAvailabilityFemale; 
  public Integer tomorrowAvailabilityDetox; 
  public Integer tomorrowAvailabilityDetoxMale; 
  public Integer tomorrowAvailabilityDetoxFemale; 
  public Integer dayThreeAvailability; 
  public Integer dayThreeAvailabilityMale; 
  public Integer dayThreeAvailabilityFemale; 
  public Integer dayThreeAvailabilityDetox; 
  public Integer dayThreeAvailabilityDetoxMale; 
  public Integer dayThreeAvailabilityDetoxFemale; 
}

}