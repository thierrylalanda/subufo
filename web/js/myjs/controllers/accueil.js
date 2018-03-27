/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function()
{
   var Carousel1Opts =
   {
      delay: 6000,
      duration: 500,
      easing: 'linear',
      mode: 'forward',
      direction: '',
      scalemode: 1,
      pagination: true,
      pagination_img_default: 'images/page_default.png',
      pagination_img_active: 'images/page_active.png',
      start: 0
   };
   $("#Carousel1").on('activate', function(event, index)
   {
      switch(index)
      {
      }
   });
   $("#Carousel1").on('beforeActivate', function(event, index)
   {
      switch(index)
      {
         case 0:
            AnimateCss('wb_Title1', 'transform-scale-in', 400, 500);
            AnimateCss('wb_Review1', 'transform-lightspeed-in', 800, 500);
            AnimateCss('wb_User1', 'animate-rotate-in-left', 800, 1000);
            break;
         case 1:
            AnimateCss('wb_Title2', 'transform-scale-in', 500, 500);
            AnimateCss('wb_Review2', 'transform-lightspeed-in', 800, 500);
            AnimateCss('wb_User2', 'animate-rotate-in-left', 800, 1000);
            break;
         case 2:
            AnimateCss('wb_Title3', 'transform-scale-in', 500, 500);
            AnimateCss('wb_Review3', 'transform-lightspeed-in', 800, 500);
            AnimateCss('wb_User3', 'animate-rotate-in-left', 800, 1000);
            break;
      }
   });
   $("#Carousel1").carousel(Carousel1Opts);
   $("#Carousel1_back a").click(function()
   {
      $('#Carousel1').carousel('prev');
   });
   $("#Carousel1_next a").click(function()
   {
      $('#Carousel1').carousel('next');
   });
   
   
   
   function LayoutGrid2Scroll()
   {
      var $obj = $("#wb_LayoutGrid2");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(false))
      {
         $obj.addClass("in-viewport");
         AnimationResume('FontAwesomeIcon1');
         AnimationResume('FontAwesomeIcon2');
         AnimationResume('FontAwesomeIcon3');
         AnimationResume('FontAwesomeIcon4');
         AnimationResume('Heading1');
         AnimationResume('wb_Heading2');
         AnimationResume('Heading3');
         AnimationResume('Heading4');
         AnimationResume('Text1');
         AnimationResume('Text2');
         AnimationResume('Text3');
         AnimationResume('Text4');
      }
   }
   LayoutGrid2Scroll();
   $(window).scroll(function(event)
   {
      LayoutGrid2Scroll();
   });
   function PanelText1Scroll()
   {
      var $obj = $("#wb_PanelText1");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelText1', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelText1', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelText1').inViewPort(true))
   {
      $('#wb_PanelText1').addClass("in-viewport");
   }
   PanelText1Scroll();
   $(window).scroll(function(event)
   {
      PanelText1Scroll();
   });
   function PanelImage1Scroll()
   {
      var $obj = $("#wb_PanelImage1");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelImage1', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelImage1', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelImage1').inViewPort(true))
   {
      $('#wb_PanelImage1').addClass("in-viewport");
   }
   PanelImage1Scroll();
   $(window).scroll(function(event)
   {
      PanelImage1Scroll();
   });
   function PanelImage2Scroll()
   {
      var $obj = $("#wb_PanelImage2");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelImage2', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelImage2', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelImage2').inViewPort(true))
   {
      $('#wb_PanelImage2').addClass("in-viewport");
   }
   PanelImage2Scroll();
   $(window).scroll(function(event)
   {
      PanelImage2Scroll();
   });
   function PanelImage3Scroll()
   {
      var $obj = $("#wb_PanelImage3");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelImage3', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelImage3', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelImage3').inViewPort(true))
   {
      $('#wb_PanelImage3').addClass("in-viewport");
   }
   PanelImage3Scroll();
   $(window).scroll(function(event)
   {
      PanelImage3Scroll();
   });
   function PanelText2Scroll()
   {
      var $obj = $("#wb_PanelText2");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelText2', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelText2', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelText2').inViewPort(true))
   {
      $('#wb_PanelText2').addClass("in-viewport");
   }
   PanelText2Scroll();
   $(window).scroll(function(event)
   {
      PanelText2Scroll();
   });
   function PanelText3Scroll()
   {
      var $obj = $("#wb_PanelText3");
      if (!$obj.hasClass("in-viewport") && $obj.inViewPort(true))
      {
         $obj.addClass("in-viewport");
         AnimateCss('wb_PanelText3', 'animate-fade-in-up', 500, 1000);
      }
      else
      if ($obj.hasClass("in-viewport") && !$obj.inViewPort(true))
      {
         $obj.removeClass("in-viewport");
         AnimateCss('wb_PanelText3', 'animate-fade-out', 0, 0);
      }
   }
   if (!$('#wb_PanelText3').inViewPort(true))
   {
      $('#wb_PanelText3').addClass("in-viewport");
   }
   PanelText3Scroll();
   $(window).scroll(function(event)
   {
      PanelText3Scroll();
   });
});

