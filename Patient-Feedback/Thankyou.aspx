<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" Inherits="Patient_Feedback.Thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            background-image: radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px),
                              radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px);
            background-position: 0 0, 25px 25px;
            background-size: 50px 50px;
        }

        .header, footer {
            background-color: darkblue;
            padding: 20px;
            text-align: center;
            color: white;
        }

        h1 {
            color: lightseagreen;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            background-color: white;
            padding: 10px;
        }

        .heart-icon {
            color: red;
            font-size: 3rem; /* Increased the font size */
            display: inline-block;
            vertical-align: middle;
        }

        /* Updated slider size */
        .slider-container {
            width: 600px; /* Increase the slider width */
            height: 300px; /* Increase the height */
            overflow: hidden;
            position: relative;
            margin: auto;
            margin-top: 30px;
            border: 2px solid lightseagreen;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .slider {
            display: flex;
            transition: transform 1s ease-in-out;
        }

        .slide {
            flex: 0 0 600px; /* Adjust the slide width to match the slider container */
            height: 300px; /* Adjust the height */
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the whole area without distortion */
            display: block;
        }
    </style>

    <body>

        <h1>Thank You for Choosing Us and Providing Your Valuable Feedback <i class="fa fa-heart heart-icon"></i></h1>

        <div class="slider-container">
            <div class="slider">
                <div class="slide"><img src="Images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg" alt="Image 1"></div>
                <div class="slide"><img src="Images/depositphotos_322579018-stock-photo-smiling-doctor-standing-on-grey.jpg" alt="Image 2"></div>
                <div class="slide"><img src="Images/images%20(1).jpeg" alt="Image 3"></div>
                <div class="slide"><img src="Images/images.jpeg" alt="Image 4"></div>
            </div>
        </div>

        <script>
            const slider = document.querySelector('.slider');
            const slides = document.querySelectorAll('.slide');
            const slideWidth = slides[0].clientWidth;
            const totalSlides = slides.length;
            let currentIndex = 0;
            let direction = 1; // 1 means forward, -1 means backward

            function nextSlide() {
                currentIndex += direction;
                if (currentIndex === totalSlides - 1 || currentIndex === 0) {
                    direction *= -1; // Change direction at the ends
                }
                updateSlider();
            }

            function updateSlider() {
                const offset = -1 * currentIndex * slideWidth;
                slider.style.transform = `translateX(${offset}px)`;
            }

            setInterval(nextSlide, 2000); // Change slide every 2 seconds
        </script>

    </body>
</asp:Content>
