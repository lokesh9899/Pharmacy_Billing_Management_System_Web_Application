<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="container">

    <!--Name-->

    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            Name: <br><span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getFirstName()} ${EmpList.get(index).getLastName()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar Name: <br><span class="
                                   <c:if test="${!(EmpList.get(index).getFirstName().equalsIgnoreCase(ApiEmp.getFirstName())&&
                                                 EmpList.get(index).getLastName().equalsIgnoreCase(ApiEmp.getLastName()))}">
                                         text-danger
                                   </c:if>
                                   text-success  fw-bold text-decoration-none">${ApiEmp.getFirstName()} ${ApiEmp.getLastName()}</span>
        </div>
    </div>

    <!--Gender-->

    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            Gender: <br><span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getGender()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar Gender: <br><span class="
                                     <c:if test="${!(EmpList.get(index).getGender().equalsIgnoreCase(ApiEmp.getGender()))}">
                                         text-danger
                                     </c:if>
                                     text-success  fw-bold text-decoration-none">${ApiEmp.getGender()}</span>
        </div>
    </div>
    <!--City-->

    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            City: <br><span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getCity()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar City: <br><span class="
                                   <c:if test="${!(EmpList.get(index).getCity().equalsIgnoreCase(ApiEmp.getCity()))}">
                                       text-danger
                                   </c:if>
                                   text-success  fw-bold text-decoration-none">${ApiEmp.getCity()}</span>
        </div>
    </div>
        
    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            DOB: <br><span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getDob()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar DOB: <br><span class="
                                   <c:if test="${!(EmpList.get(index).getDob().equalsIgnoreCase(ApiEmp.getDob()))}">
                                       text-danger
                                   </c:if>
                                   text-success  fw-bold text-decoration-none">${ApiEmp.getDob()}</span>
        </div>
    </div>

<!--    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            DOB: <span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getDob()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar DOB: <span class="text-primary fw-bold text-decoration-none">${ApiEmp.getDob()}</span>
        </div>
    </div>-->

    <div class="row">
        <div class="col fw-normal text-muted mb-4">
            Qualification: <span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getQualification()}</span>
        </div>
        <div class="col fw-normal text-muted mb-4">
            Aadhar no: <span class="text-primary fw-bold text-decoration-none">${EmpList.get(index).getAadharNo()}</span>
        </div>
    </div>
</div>

