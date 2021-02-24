<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Practical_Assignment.HomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    
    <!-- css -->
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
    <div style=" padding:0px 10px"> <!-- page body style -->
    
	<div style="border: 1px solid #808080; text-align:center; background-color:#FF9900; margin: -8px 70px -8px 70px; padding:10px; font-family: Papyrus; font-size: 24px; font-weight: normal; color: #FFFF99;">
		A L	Z E N D A &nbsp  A R T W O R K &nbsp S A L E S &nbsp  G A L L E R Y
	</div>

	<br/>


			
	<!-- Slide -->
	    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin:0px 15%;"><!-- control slide position -->
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="Sample Images/image2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Street</h5>
            <p>Old classic painting style</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Sample Images/image3.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Food</h5>
            <p>A variety of junk food</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Sample Images/image5.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>flower</h5>
            <p>CG</p>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

	<br/>

	<!--	<div style="margin-left:70px">
			<h2>Recent upload painting</h2>
	    <div>
				<br/>
		</div> -->
		</div>
		<div class="container" >
			<asp:Image ID="JoinUs" runat="server" ImageUrl="~/Sample Images/Join us.jpg" Width="1100px"/>

			<div class="centered">
				<p style="font-family: 'Bauhaus 93'; font-size: 42px; color: #EEEEEE; font-weight: bold;text-shadow: 2px 2px 5px grey;">Interested in selling your work?</p>
				<br/>
				<br />                
				<a href="SellArt.aspx"" >Click here to contribute your artwork</a>                
			</div>            
		</div>
        <br/>
	</div>
    
</asp:Content>
