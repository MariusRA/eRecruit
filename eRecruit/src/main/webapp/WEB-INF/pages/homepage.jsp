<%-- 
    Document   : homepage
    Created on : Jan 7, 2021, 1:14:59 AM
    Author     : Denisa
--%>
<t:pageTemplate pageTitle="Login">
    <div class="title-holder"> 
        <span>e-Recruit</span>
    </div>

    <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval="4000">
                <img src="${pageContext.request.contextPath}/carousel/2522.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-interval="4000">
                <img src="${pageContext.request.contextPath}/carousel/19341.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</t:pagetemplate>   
<style>
    .carousel-inner, 
    .carousel-item img {
        height: 600px;
    }

    .carousel-item img {
        position: relative;
        margin: 0 auto;
        opacity: 31.3%;
    }
    .title-holder {
        text-align: center;
        width: 100%;
        margin: 60px 0;
        position: absolute;
        font-size: 100px;
        z-index: 1;
        top: 200px;
    }
    .title-holder span {
        background-color: #ffffff;
        padding: 10px 50px;
        border-radius: 10px;
        color: #5C4634;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
