<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Practical_Assignment.HomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <link href="HomePage.css" rel="stylesheet" type="text/css" />
    <div style="margin:0 15% 0% 15%;  background-color: white; padding:0% 5% 0% 5%";> <!-- page body style -->
    <br/>
	<!-- Slide -->  
	<div class="slideshow-container">
      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="Sample Images/20181126_125649.jpg" style="width:50%">
        <div class="text">Caption Text</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="img2.jpg" style="width:100%">
        <div class="text">Caption Two</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="img3.jpg" style="width:100%">
        <div class="text">Caption Three</div>
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>

	<script> <!-- Slide js -->
			var slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) 
			{
				showSlides(slideIndex += n);
			}
			
			function currentSlide(n) 
			{
				showSlides(slideIndex = n);
			}

			function showSlides(n) 
			{
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("dot");
				if (n > slides.length) {slideIndex = 1} 
				if (n < 1) 
				{
					slideIndex = slides.length
				}
				for (i = 0; i < slides.length; i++) 
				{
					slides[i].style.display = "none"; 
				}
				for (i = 0; i < dots.length; i++) 
				{
					dots[i].className = dots[i].className.replace(" active", "");
				}
				slides[slideIndex-1].style.display = "block"; 
				dots[slideIndex-1].className += " active";
			}
    </script>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
		</div>
	
</asp:Content>
