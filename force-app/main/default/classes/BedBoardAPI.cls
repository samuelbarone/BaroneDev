public class BedBoardAPI 
{    
    public static BedBoardFacilityResponse getBedBoardFacility(string facilityName)
    { 
        string ep = 'http://bedboardapi.contactaac.com/api/v1/bedavailability/' + facilityName;
        
        system.debug(ep);
        
        Map<string, string> headerMap = new Map<string, string>();
        headerMap.put('Authorization','api-key ab9506cd6a444a91bb51dd7a103cc80a:T9yUb3C8dYtycz6p9C7YbMm0BScOcEP79gcg+vowrco='); 
        headerMap.put('Content-Type','application/json');  
        
        HttpResponse res = getResponse('GET',ep,'',headerMap); 
       
        BedBoardFacilityResponse result;
        if(res.getStatusCode() == 200)
        {
            system.debug('here');
            if(res.getBody() != 'null')
            {
                string json = res.getBody();
                system.debug(json);
              //  BedBoardFacilityResponse response = (BedBoardFacilityResponse)System.JSON.deserialize(json, BedBoardFacilityResponse.class);
                                  
                result = null;
            }
        }
        else
        {
            system.debug(res);
            
           result = null;
        }
        
        return result;
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

  public String getClientId() { return this.clientId; }

  public void setClientId(String clientId) { this.clientId = clientId; }

  private String clientName;

  public String getClientName() { return this.clientName; }

  public void setClientName(String clientName) { this.clientName = clientName; }

  private String caseStatus;

  public String getCaseStatus() { return this.caseStatus; }

  public void setCaseStatus(String caseStatus) { this.caseStatus = caseStatus; }

  private String clientGender;

  public String getClientGender() { return this.clientGender; }

  public void setClientGender(String clientGender) { this.clientGender = clientGender; }

  private String caseNumber;

  public String getCaseNumber() { return this.caseNumber; }

  public void setCaseNumber(String caseNumber) { this.caseNumber = caseNumber; }

  private Date arrivalDate;

  public Date getArrivalDate() { return this.arrivalDate; }

  public void setArrivalDate(Date arrivalDate) { this.arrivalDate = arrivalDate; }

  private String arrivalTime;

  public String getArrivalTime() { return this.arrivalTime; }

  public void setArrivalTime(String arrivalTime) { this.arrivalTime = arrivalTime; }

  private String arrivalTimeZone;

  public String getArrivalTimeZone() { return this.arrivalTimeZone; }

  public void setArrivalTimeZone(String arrivalTimeZone) { this.arrivalTimeZone = arrivalTimeZone; }

  private String arrivalTimeAmPm;

  public String getArrivalTimeAmPm() { return this.arrivalTimeAmPm; }

  public void setArrivalTimeAmPm(String arrivalTimeAmPm) { this.arrivalTimeAmPm = arrivalTimeAmPm; }

  private boolean arrivingToday;

  public boolean getArrivingToday() { return this.arrivingToday; }

  public void setArrivingToday(boolean arrivingToday) { this.arrivingToday = arrivingToday; }

  private String facilityId;

  public String getFacilityId() { return this.facilityId; }

  public void setFacilityId(String facilityId) { this.facilityId = facilityId; }

  private String facility;

  public String getFacility() { return this.facility; }

  public void setFacility(String facility) { this.facility = facility; }

  private String detoxFacilityId;

  public String getDetoxFacilityId() { return this.detoxFacilityId; }

  public void setDetoxFacilityId(String detoxFacilityId) { this.detoxFacilityId = detoxFacilityId; }

  private String detoxFacility;

  public String getDetoxFacility() { return this.detoxFacility; }

  public void setDetoxFacility(String detoxFacility) { this.detoxFacility = detoxFacility; }

  private object facilityAdmissionDate;

  public object getFacilityAdmissionDate() { return this.facilityAdmissionDate; }

  public void setFacilityAdmissionDate(object facilityAdmissionDate) { this.facilityAdmissionDate = facilityAdmissionDate; }

  private object treatmentConsultant;

  public object getTreatmentConsultant() { return this.treatmentConsultant; }

  public void setTreatmentConsultant(object treatmentConsultant) { this.treatmentConsultant = treatmentConsultant; }

  private object bdmm;

  public object getBdmm() { return this.bdmm; }

  public void setBdmm(object bdmm) { this.bdmm = bdmm; }

  private object bdRep;

  public object getBdRep() { return this.bdRep; }

  public void setBdRep(object bdRep) { this.bdRep = bdRep; }

  private object referralSource;

  public object getReferralSource() { return this.referralSource; }

  public void setReferralSource(object referralSource) { this.referralSource = referralSource; }

  private object methodOfPayment;

  public object getMethodOfPayment() { return this.methodOfPayment; }

  public void setMethodOfPayment(object methodOfPayment) { this.methodOfPayment = methodOfPayment; }

  private Integer cashCollected;

  public Integer getCashCollected() { return this.cashCollected; }

  public void setCashCollected(Integer cashCollected) { this.cashCollected = cashCollected; }

  private object colorCode;

  public object getColorCode() { return this.colorCode; }

  public void setColorCode(object colorCode) { this.colorCode = colorCode; }

  private String transportationStatus;

  public String getTransportationStatus() { return this.transportationStatus; }

  public void setTransportationStatus(String transportationStatus) { this.transportationStatus = transportationStatus; }

  private boolean transportationReservedForLocalReferral;

  public boolean getTransportationReservedForLocalReferral() { return this.transportationReservedForLocalReferral; }

  public void setTransportationReservedForLocalReferral(boolean transportationReservedForLocalReferral) { this.transportationReservedForLocalReferral = transportationReservedForLocalReferral; }

  private object departingAirline;

  public object getDepartingAirline() { return this.departingAirline; }

  public void setDepartingAirline(object departingAirline) { this.departingAirline = departingAirline; }

  private object departingFlightNumber;

  public object getDepartingFlightNumber() { return this.departingFlightNumber; }

  public void setDepartingFlightNumber(object departingFlightNumber) { this.departingFlightNumber = departingFlightNumber; }

  private object departingCity;

  public object getDepartingCity() { return this.departingCity; }

  public void setDepartingCity(object departingCity) { this.departingCity = departingCity; }

  private object departingState;

  public object getDepartingState() { return this.departingState; }

  public void setDepartingState(object departingState) { this.departingState = departingState; }

  private Date departureDate;

  public Date getDepartureDate() { return this.departureDate; }

  public void setDepartureDate(Date departureDate) { this.departureDate = departureDate; }

  private object departureTime;

  public object getDepartureTime() { return this.departureTime; }

  public void setDepartureTime(object departureTime) { this.departureTime = departureTime; }

  private object departureTimeAmPm;

  public object getDepartureTimeAmPm() { return this.departureTimeAmPm; }

  public void setDepartureTimeAmPm(object departureTimeAmPm) { this.departureTimeAmPm = departureTimeAmPm; }

  private object departureTimeZone;

  public object getDepartureTimeZone() { return this.departureTimeZone; }

  public void setDepartureTimeZone(object departureTimeZone) { this.departureTimeZone = departureTimeZone; }

  private String demographics;

  public String getDemographics() { return this.demographics; }

  public void setDemographics(String demographics) { this.demographics = demographics; }

  private boolean detoxOnly;

  public boolean getDetoxOnly() { return this.detoxOnly; }

  public void setDetoxOnly(boolean detoxOnly) { this.detoxOnly = detoxOnly; }

  private boolean outpatientOnly;

  public boolean getOutpatientOnly() { return this.outpatientOnly; }

  public void setOutpatientOnly(boolean outpatientOnly) { this.outpatientOnly = outpatientOnly; }

  private String createdBy;

  public String getCreatedBy() { return this.createdBy; }

  public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

  private Date createdDate;

  public Date getCreatedDate() { return this.createdDate; }

  public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }

  private String bedBoardFacility;

  public String getBedBoardFacility() { return this.bedBoardFacility; }

  public void setBedBoardFacility(String bedBoardFacility) { this.bedBoardFacility = bedBoardFacility; }

  private String bedBoardFacilityId;

  public String getBedBoardFacilityId() { return this.bedBoardFacilityId; }

  public void setBedBoardFacilityId(String bedBoardFacilityId) { this.bedBoardFacilityId = bedBoardFacilityId; }
}

public class WorkList
{
  private String business;

  public String getBusiness() { return this.business; }

  public void setBusiness(String business) { this.business = business; }

  private String location;

  public String getLocation() { return this.location; }

  public void setLocation(String location) { this.location = location; }

  private String facility;

  public String getFacility() { return this.facility; }

  public void setFacility(String facility) { this.facility = facility; }

  private String facilitySalesforceName;

  public String getFacilitySalesforceName() { return this.facilitySalesforceName; }

  public void setFacilitySalesforceName(String facilitySalesforceName) { this.facilitySalesforceName = facilitySalesforceName; }

  private String facilitySalesforceId;

  public String getFacilitySalesforceId() { return this.facilitySalesforceId; }

  public void setFacilitySalesforceId(String facilitySalesforceId) { this.facilitySalesforceId = facilitySalesforceId; }

  private String building;

  public String getBuilding() { return this.building; }

  public void setBuilding(String building) { this.building = building; }

  private String bed;

  public String getBed() { return this.bed; }

  public void setBed(String bed) { this.bed = bed; }

  private String room;

  public String getRoom() { return this.room; }

  public void setRoom(String room) { this.room = room; }

  private Integer roomId;

  public Integer getRoomId() { return this.roomId; }

  public void setRoomId(Integer roomId) { this.roomId = roomId; }

  private String client;

  public String getClient() { return this.client; }

  public void setClient(String client) { this.client = client; }

  private String salesforceId;

  public String getSalesforceId() { return this.salesforceId; }

  public void setSalesforceId(String salesforceId) { this.salesforceId = salesforceId; }

  private String gender;

  public String getGender() { return this.gender; }

  public void setGender(String gender) { this.gender = gender; }

  private String admitDate;

  public String getAdmitDate() { return this.admitDate; }

  public void setAdmitDate(String admitDate) { this.admitDate = admitDate; }

  private String program;

  public String getProgram() { return this.program; }

  public void setProgram(String program) { this.program = program; }

  private String programCode;

  public String getProgramCode() { return this.programCode; }

  public void setProgramCode(String programCode) { this.programCode = programCode; }

  private Integer lengthOfStay;

  public Integer getLengthOfStay() { return this.lengthOfStay; }

  public void setLengthOfStay(Integer lengthOfStay) { this.lengthOfStay = lengthOfStay; }

  private boolean isAvailable;

  public boolean getIsAvailable() { return this.isAvailable; }

  public void setIsAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }

  private boolean dischargingToday;

  public boolean getDischargingToday() { return this.dischargingToday; }

  public void setDischargingToday(boolean dischargingToday) { this.dischargingToday = dischargingToday; }

  private String edod;

  public String getEdod() { return this.edod; }

  public void setEdod(String edod) { this.edod = edod; }

  private object detoxCompletionDate;

  public object getDetoxCompletionDate() { return this.detoxCompletionDate; }

  public void setDetoxCompletionDate(object detoxCompletionDate) { this.detoxCompletionDate = detoxCompletionDate; }

  private String roomGender;

  public String getRoomGender() { return this.roomGender; }

  public void setRoomGender(String roomGender) { this.roomGender = roomGender; }

  private Integer roomBeds;

  public Integer getRoomBeds() { return this.roomBeds; }

  public void setRoomBeds(Integer roomBeds) { this.roomBeds = roomBeds; }

  private boolean isReserved;

  public boolean getIsReserved() { return this.isReserved; }

  public void setIsReserved(boolean isReserved) { this.isReserved = isReserved; }

  private boolean isSpecial;

  public boolean getIsSpecial() { return this.isSpecial; }

  public void setIsSpecial(boolean isSpecial) { this.isSpecial = isSpecial; }

  private boolean isOverflow;

  public boolean getIsOverflow() { return this.isOverflow; }

  public void setIsOverflow(boolean isOverflow) { this.isOverflow = isOverflow; }

  private boolean detoxOnly;

  public boolean getDetoxOnly() { return this.detoxOnly; }

  public void setDetoxOnly(boolean detoxOnly) { this.detoxOnly = detoxOnly; }

  private boolean isInactive;

  public boolean getIsInactive() { return this.isInactive; }

  public void setIsInactive(boolean isInactive) { this.isInactive = isInactive; }

  private List<Arrival> arrivals;

  public List<Arrival> getArrivals() { return this.arrivals; }

  public void setArrivals(List<Arrival> arrivals) { this.arrivals = arrivals; }

  private List<object> waitingList;

  public List<object> getWaitingList() { return this.waitingList; }

  public void setWaitingList(List<object> waitingList) { this.waitingList = waitingList; }
}

public class BedBoardFacilityResponse
{
  private String facilityId;

  public String getFacilityId() { return this.facilityId; }

  public void setFacilityId(String facilityId) { this.facilityId = facilityId; }

  private String facilityName;

  public String getFacilityName() { return this.facilityName; }

  public void setFacilityName(String facilityName) { this.facilityName = facilityName; }

  private String location;

  public String getLocation() { return this.location; }

  public void setLocation(String location) { this.location = location; }

  private List<WorkList> workList;

  public List<WorkList> getWorkList() { return this.workList; }

  public void setWorkList(List<WorkList> workList) { this.workList = workList; }

  private Integer totalBeds;

  public Integer getTotalBeds() { return this.totalBeds; }

  public void setTotalBeds(Integer totalBeds) { this.totalBeds = totalBeds; }

  private Integer usedBeds;

  public Integer getUsedBeds() { return this.usedBeds; }

  public void setUsedBeds(Integer usedBeds) { this.usedBeds = usedBeds; }

  private Integer availableBeds;

  public Integer getAvailableBeds() { return this.availableBeds; }

  public void setAvailableBeds(Integer availableBeds) { this.availableBeds = availableBeds; }

  private Integer booked;

  public Integer getBooked() { return this.booked; }

  public void setBooked(Integer booked) { this.booked = booked; }

  private Integer reservedBeds;

  public Integer getReservedBeds() { return this.reservedBeds; }

  public void setReservedBeds(Integer reservedBeds) { this.reservedBeds = reservedBeds; }

  private Integer inactiveBeds;

  public Integer getInactiveBeds() { return this.inactiveBeds; }

  public void setInactiveBeds(Integer inactiveBeds) { this.inactiveBeds = inactiveBeds; }

  private Integer dischargingToday;

  public Integer getDischargingToday() { return this.dischargingToday; }

  public void setDischargingToday(Integer dischargingToday) { this.dischargingToday = dischargingToday; }

  private Integer arrivalsToday;

  public Integer getArrivalsToday() { return this.arrivalsToday; }

  public void setArrivalsToday(Integer arrivalsToday) { this.arrivalsToday = arrivalsToday; }

  private Integer admitsToday;

  public Integer getAdmitsToday() { return this.admitsToday; }

  public void setAdmitsToday(Integer admitsToday) { this.admitsToday = admitsToday; }

  private Integer overflowBeds;

  public Integer getOverflowBeds() { return this.overflowBeds; }

  public void setOverflowBeds(Integer overflowBeds) { this.overflowBeds = overflowBeds; }

  private Integer specialBeds;

  public Integer getSpecialBeds() { return this.specialBeds; }

  public void setSpecialBeds(Integer specialBeds) { this.specialBeds = specialBeds; }

  private Integer totalDetoxBeds;

  public Integer getTotalDetoxBeds() { return this.totalDetoxBeds; }

  public void setTotalDetoxBeds(Integer totalDetoxBeds) { this.totalDetoxBeds = totalDetoxBeds; }

  private Integer totalDetoxBedsUsed;

  public Integer getTotalDetoxBedsUsed() { return this.totalDetoxBedsUsed; }

  public void setTotalDetoxBedsUsed(Integer totalDetoxBedsUsed) { this.totalDetoxBedsUsed = totalDetoxBedsUsed; }

  private Integer totalDetoxBedsAvailable;

  public Integer getTotalDetoxBedsAvailable() { return this.totalDetoxBedsAvailable; }

  public void setTotalDetoxBedsAvailable(Integer totalDetoxBedsAvailable) { this.totalDetoxBedsAvailable = totalDetoxBedsAvailable; }

  private Integer maleTotalBeds;

  public Integer getMaleTotalBeds() { return this.maleTotalBeds; }

  public void setMaleTotalBeds(Integer maleTotalBeds) { this.maleTotalBeds = maleTotalBeds; }

  private Integer maleBedsUsed;

  public Integer getMaleBedsUsed() { return this.maleBedsUsed; }

  public void setMaleBedsUsed(Integer maleBedsUsed) { this.maleBedsUsed = maleBedsUsed; }

  private Integer maleBedsAvailable;

  public Integer getMaleBedsAvailable() { return this.maleBedsAvailable; }

  public void setMaleBedsAvailable(Integer maleBedsAvailable) { this.maleBedsAvailable = maleBedsAvailable; }

  private Integer totalDetoxMaleBeds;

  public Integer getTotalDetoxMaleBeds() { return this.totalDetoxMaleBeds; }

  public void setTotalDetoxMaleBeds(Integer totalDetoxMaleBeds) { this.totalDetoxMaleBeds = totalDetoxMaleBeds; }

  private Integer maleDetoxBedsAvailable;

  public Integer getMaleDetoxBedsAvailable() { return this.maleDetoxBedsAvailable; }

  public void setMaleDetoxBedsAvailable(Integer maleDetoxBedsAvailable) { this.maleDetoxBedsAvailable = maleDetoxBedsAvailable; }

  private Integer maleSpecialBedsAvailable;

  public Integer getMaleSpecialBedsAvailable() { return this.maleSpecialBedsAvailable; }

  public void setMaleSpecialBedsAvailable(Integer maleSpecialBedsAvailable) { this.maleSpecialBedsAvailable = maleSpecialBedsAvailable; }

  private Integer femaleTotalBeds;

  public Integer getFemaleTotalBeds() { return this.femaleTotalBeds; }

  public void setFemaleTotalBeds(Integer femaleTotalBeds) { this.femaleTotalBeds = femaleTotalBeds; }

  private Integer femaleBedsUsed;

  public Integer getFemaleBedsUsed() { return this.femaleBedsUsed; }

  public void setFemaleBedsUsed(Integer femaleBedsUsed) { this.femaleBedsUsed = femaleBedsUsed; }

  private Integer femaleBedsAvailable;

  public Integer getFemaleBedsAvailable() { return this.femaleBedsAvailable; }

  public void setFemaleBedsAvailable(Integer femaleBedsAvailable) { this.femaleBedsAvailable = femaleBedsAvailable; }

  private Integer totalDetoxFemaleBeds;

  public Integer getTotalDetoxFemaleBeds() { return this.totalDetoxFemaleBeds; }

  public void setTotalDetoxFemaleBeds(Integer totalDetoxFemaleBeds) { this.totalDetoxFemaleBeds = totalDetoxFemaleBeds; }

  private Integer femaleDetoxBedsAvailable;

  public Integer getFemaleDetoxBedsAvailable() { return this.femaleDetoxBedsAvailable; }

  public void setFemaleDetoxBedsAvailable(Integer femaleDetoxBedsAvailable) { this.femaleDetoxBedsAvailable = femaleDetoxBedsAvailable; }

  private Integer femaleSpecialBedsAvailable;

  public Integer getFemaleSpecialBedsAvailable() { return this.femaleSpecialBedsAvailable; }

  public void setFemaleSpecialBedsAvailable(Integer femaleSpecialBedsAvailable) { this.femaleSpecialBedsAvailable = femaleSpecialBedsAvailable; }

  private Integer flexTotalBeds;

  public Integer getFlexTotalBeds() { return this.flexTotalBeds; }

  public void setFlexTotalBeds(Integer flexTotalBeds) { this.flexTotalBeds = flexTotalBeds; }

  private Integer flexBedsUsed;

  public Integer getFlexBedsUsed() { return this.flexBedsUsed; }

  public void setFlexBedsUsed(Integer flexBedsUsed) { this.flexBedsUsed = flexBedsUsed; }

  private Integer flexBedsAvailable;

  public Integer getFlexBedsAvailable() { return this.flexBedsAvailable; }

  public void setFlexBedsAvailable(Integer flexBedsAvailable) { this.flexBedsAvailable = flexBedsAvailable; }

  private Integer totalDetoxFlexBeds;

  public Integer getTotalDetoxFlexBeds() { return this.totalDetoxFlexBeds; }

  public void setTotalDetoxFlexBeds(Integer totalDetoxFlexBeds) { this.totalDetoxFlexBeds = totalDetoxFlexBeds; }

  private Integer flexDetoxBedsAvailable;

  public Integer getFlexDetoxBedsAvailable() { return this.flexDetoxBedsAvailable; }

  public void setFlexDetoxBedsAvailable(Integer flexDetoxBedsAvailable) { this.flexDetoxBedsAvailable = flexDetoxBedsAvailable; }

  private Integer day1Beds;

  public Integer getDay1Beds() { return this.day1Beds; }

  public void setDay1Beds(Integer day1Beds) { this.day1Beds = day1Beds; }

  private Integer day1arrivals;

  public Integer getDay1arrivals() { return this.day1arrivals; }

  public void setDay1arrivals(Integer day1arrivals) { this.day1arrivals = day1arrivals; }

  private Integer day1arrivalsMale;

  public Integer getDay1arrivalsMale() { return this.day1arrivalsMale; }

  public void setDay1arrivalsMale(Integer day1arrivalsMale) { this.day1arrivalsMale = day1arrivalsMale; }

  private Integer day1arrivalsFemale;

  public Integer getDay1arrivalsFemale() { return this.day1arrivalsFemale; }

  public void setDay1arrivalsFemale(Integer day1arrivalsFemale) { this.day1arrivalsFemale = day1arrivalsFemale; }

  private Integer day1departures;

  public Integer getDay1departures() { return this.day1departures; }

  public void setDay1departures(Integer day1departures) { this.day1departures = day1departures; }

  private Integer day1departuresMale;

  public Integer getDay1departuresMale() { return this.day1departuresMale; }

  public void setDay1departuresMale(Integer day1departuresMale) { this.day1departuresMale = day1departuresMale; }

  private Integer day1departuresFemale;

  public Integer getDay1departuresFemale() { return this.day1departuresFemale; }

  public void setDay1departuresFemale(Integer day1departuresFemale) { this.day1departuresFemale = day1departuresFemale; }

  private Integer day2Beds;

  public Integer getDay2Beds() { return this.day2Beds; }

  public void setDay2Beds(Integer day2Beds) { this.day2Beds = day2Beds; }

  private Integer day2arrivals;

  public Integer getDay2arrivals() { return this.day2arrivals; }

  public void setDay2arrivals(Integer day2arrivals) { this.day2arrivals = day2arrivals; }

  private Integer day2arrivalsMale;

  public Integer getDay2arrivalsMale() { return this.day2arrivalsMale; }

  public void setDay2arrivalsMale(Integer day2arrivalsMale) { this.day2arrivalsMale = day2arrivalsMale; }

  private Integer day2arrivalsFemale;

  public Integer getDay2arrivalsFemale() { return this.day2arrivalsFemale; }

  public void setDay2arrivalsFemale(Integer day2arrivalsFemale) { this.day2arrivalsFemale = day2arrivalsFemale; }

  private Integer day2departures;

  public Integer getDay2departures() { return this.day2departures; }

  public void setDay2departures(Integer day2departures) { this.day2departures = day2departures; }

  private Integer day2departuresMale;

  public Integer getDay2departuresMale() { return this.day2departuresMale; }

  public void setDay2departuresMale(Integer day2departuresMale) { this.day2departuresMale = day2departuresMale; }

  private Integer day2departuresFemale;

  public Integer getDay2departuresFemale() { return this.day2departuresFemale; }

  public void setDay2departuresFemale(Integer day2departuresFemale) { this.day2departuresFemale = day2departuresFemale; }

  private Integer day3Beds;

  public Integer getDay3Beds() { return this.day3Beds; }

  public void setDay3Beds(Integer day3Beds) { this.day3Beds = day3Beds; }

  private Integer day3arrivals;

  public Integer getDay3arrivals() { return this.day3arrivals; }

  public void setDay3arrivals(Integer day3arrivals) { this.day3arrivals = day3arrivals; }

  private Integer day3arrivalsMale;

  public Integer getDay3arrivalsMale() { return this.day3arrivalsMale; }

  public void setDay3arrivalsMale(Integer day3arrivalsMale) { this.day3arrivalsMale = day3arrivalsMale; }

  private Integer day3arrivalsFemale;

  public Integer getDay3arrivalsFemale() { return this.day3arrivalsFemale; }

  public void setDay3arrivalsFemale(Integer day3arrivalsFemale) { this.day3arrivalsFemale = day3arrivalsFemale; }

  private Integer day3departures;

  public Integer getDay3departures() { return this.day3departures; }

  public void setDay3departures(Integer day3departures) { this.day3departures = day3departures; }

  private Integer day3departuresMale;

  public Integer getDay3departuresMale() { return this.day3departuresMale; }

  public void setDay3departuresMale(Integer day3departuresMale) { this.day3departuresMale = day3departuresMale; }

  private Integer day3departuresFemale;

  public Integer getDay3departuresFemale() { return this.day3departuresFemale; }

  public void setDay3departuresFemale(Integer day3departuresFemale) { this.day3departuresFemale = day3departuresFemale; }

  private Integer day4Beds;

  public Integer getDay4Beds() { return this.day4Beds; }

  public void setDay4Beds(Integer day4Beds) { this.day4Beds = day4Beds; }

  private Integer day4arrivals;

  public Integer getDay4arrivals() { return this.day4arrivals; }

  public void setDay4arrivals(Integer day4arrivals) { this.day4arrivals = day4arrivals; }

  private Integer day4arrivalsMale;

  public Integer getDay4arrivalsMale() { return this.day4arrivalsMale; }

  public void setDay4arrivalsMale(Integer day4arrivalsMale) { this.day4arrivalsMale = day4arrivalsMale; }

  private Integer day4arrivalsFemale;

  public Integer getDay4arrivalsFemale() { return this.day4arrivalsFemale; }

  public void setDay4arrivalsFemale(Integer day4arrivalsFemale) { this.day4arrivalsFemale = day4arrivalsFemale; }

  private Integer day4departures;

  public Integer getDay4departures() { return this.day4departures; }

  public void setDay4departures(Integer day4departures) { this.day4departures = day4departures; }

  private Integer day4departuresMale;

  public Integer getDay4departuresMale() { return this.day4departuresMale; }

  public void setDay4departuresMale(Integer day4departuresMale) { this.day4departuresMale = day4departuresMale; }

  private Integer day4departuresFemale;

  public Integer getDay4departuresFemale() { return this.day4departuresFemale; }

  public void setDay4departuresFemale(Integer day4departuresFemale) { this.day4departuresFemale = day4departuresFemale; }

  private Integer waitingClients;

  public Integer getWaitingClients() { return this.waitingClients; }

  public void setWaitingClients(Integer waitingClients) { this.waitingClients = waitingClients; }

  private Integer waitingMales;

  public Integer getWaitingMales() { return this.waitingMales; }

  public void setWaitingMales(Integer waitingMales) { this.waitingMales = waitingMales; }

  private Integer waitingFemales;

  public Integer getWaitingFemales() { return this.waitingFemales; }

  public void setWaitingFemales(Integer waitingFemales) { this.waitingFemales = waitingFemales; }

  private Integer todayAvailability;

  public Integer getTodayAvailability() { return this.todayAvailability; }

  public void setTodayAvailability(Integer todayAvailability) { this.todayAvailability = todayAvailability; }

  private Integer todayAvailabilityMale;

  public Integer getTodayAvailabilityMale() { return this.todayAvailabilityMale; }

  public void setTodayAvailabilityMale(Integer todayAvailabilityMale) { this.todayAvailabilityMale = todayAvailabilityMale; }

  private Integer todayAvailabilityFemale;

  public Integer getTodayAvailabilityFemale() { return this.todayAvailabilityFemale; }

  public void setTodayAvailabilityFemale(Integer todayAvailabilityFemale) { this.todayAvailabilityFemale = todayAvailabilityFemale; }

  private Integer todayAvailabilityDetox;

  public Integer getTodayAvailabilityDetox() { return this.todayAvailabilityDetox; }

  public void setTodayAvailabilityDetox(Integer todayAvailabilityDetox) { this.todayAvailabilityDetox = todayAvailabilityDetox; }

  private Integer todayAvailabilityDetoxMale;

  public Integer getTodayAvailabilityDetoxMale() { return this.todayAvailabilityDetoxMale; }

  public void setTodayAvailabilityDetoxMale(Integer todayAvailabilityDetoxMale) { this.todayAvailabilityDetoxMale = todayAvailabilityDetoxMale; }

  private Integer todayAvailabilityDetoxFemale;

  public Integer getTodayAvailabilityDetoxFemale() { return this.todayAvailabilityDetoxFemale; }

  public void setTodayAvailabilityDetoxFemale(Integer todayAvailabilityDetoxFemale) { this.todayAvailabilityDetoxFemale = todayAvailabilityDetoxFemale; }

  private Integer tomorrowAvailability;

  public Integer getTomorrowAvailability() { return this.tomorrowAvailability; }

  public void setTomorrowAvailability(Integer tomorrowAvailability) { this.tomorrowAvailability = tomorrowAvailability; }

  private Integer tomorrowAvailabilityMale;

  public Integer getTomorrowAvailabilityMale() { return this.tomorrowAvailabilityMale; }

  public void setTomorrowAvailabilityMale(Integer tomorrowAvailabilityMale) { this.tomorrowAvailabilityMale = tomorrowAvailabilityMale; }

  private Integer tomorrowAvailabilityFemale;

  public Integer getTomorrowAvailabilityFemale() { return this.tomorrowAvailabilityFemale; }

  public void setTomorrowAvailabilityFemale(Integer tomorrowAvailabilityFemale) { this.tomorrowAvailabilityFemale = tomorrowAvailabilityFemale; }

  private Integer tomorrowAvailabilityDetox;

  public Integer getTomorrowAvailabilityDetox() { return this.tomorrowAvailabilityDetox; }

  public void setTomorrowAvailabilityDetox(Integer tomorrowAvailabilityDetox) { this.tomorrowAvailabilityDetox = tomorrowAvailabilityDetox; }

  private Integer tomorrowAvailabilityDetoxMale;

  public Integer getTomorrowAvailabilityDetoxMale() { return this.tomorrowAvailabilityDetoxMale; }

  public void setTomorrowAvailabilityDetoxMale(Integer tomorrowAvailabilityDetoxMale) { this.tomorrowAvailabilityDetoxMale = tomorrowAvailabilityDetoxMale; }

  private Integer tomorrowAvailabilityDetoxFemale;

  public Integer getTomorrowAvailabilityDetoxFemale() { return this.tomorrowAvailabilityDetoxFemale; }

  public void setTomorrowAvailabilityDetoxFemale(Integer tomorrowAvailabilityDetoxFemale) { this.tomorrowAvailabilityDetoxFemale = tomorrowAvailabilityDetoxFemale; }

  private Integer dayThreeAvailability;

  public Integer getDayThreeAvailability() { return this.dayThreeAvailability; }

  public void setDayThreeAvailability(Integer dayThreeAvailability) { this.dayThreeAvailability = dayThreeAvailability; }

  private Integer dayThreeAvailabilityMale;

  public Integer getDayThreeAvailabilityMale() { return this.dayThreeAvailabilityMale; }

  public void setDayThreeAvailabilityMale(Integer dayThreeAvailabilityMale) { this.dayThreeAvailabilityMale = dayThreeAvailabilityMale; }

  private Integer dayThreeAvailabilityFemale;

  public Integer getDayThreeAvailabilityFemale() { return this.dayThreeAvailabilityFemale; }

  public void setDayThreeAvailabilityFemale(Integer dayThreeAvailabilityFemale) { this.dayThreeAvailabilityFemale = dayThreeAvailabilityFemale; }

  private Integer dayThreeAvailabilityDetox;

  public Integer getDayThreeAvailabilityDetox() { return this.dayThreeAvailabilityDetox; }

  public void setDayThreeAvailabilityDetox(Integer dayThreeAvailabilityDetox) { this.dayThreeAvailabilityDetox = dayThreeAvailabilityDetox; }

  private Integer dayThreeAvailabilityDetoxMale;

  public Integer getDayThreeAvailabilityDetoxMale() { return this.dayThreeAvailabilityDetoxMale; }

  public void setDayThreeAvailabilityDetoxMale(Integer dayThreeAvailabilityDetoxMale) { this.dayThreeAvailabilityDetoxMale = dayThreeAvailabilityDetoxMale; }

  private Integer dayThreeAvailabilityDetoxFemale;

  public Integer getDayThreeAvailabilityDetoxFemale() { return this.dayThreeAvailabilityDetoxFemale; }

  public void setDayThreeAvailabilityDetoxFemale(Integer dayThreeAvailabilityDetoxFemale) { this.dayThreeAvailabilityDetoxFemale = dayThreeAvailabilityDetoxFemale; }
}

}