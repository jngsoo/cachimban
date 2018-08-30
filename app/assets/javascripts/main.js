(function($) {
	"use strict"

	///////////////////////////
	// Preloader
	$(window).on('load', function() {
		$("#preloader").delay(600).fadeOut();
	});

	///////////////////////////
	// Scrollspy
	$('body').scrollspy({
		target: '#nav',
		offset: $(window).height() / 2
	});

	///////////////////////////
	// Smooth scroll
	$("#nav .main-nav a[href^='#']").on('click', function(e) {
		e.preventDefault();
		var hash = this.hash;
		$('html, body').animate({
			scrollTop: $(this.hash).offset().top
		}, 600);
	});

	$('#back-to-top').on('click', function(){
		$('body,html').animate({
			scrollTop: 0
		}, 600);
	});

	///////////////////////////
	// Btn nav collapse
	$('#nav .nav-collapse').on('click', function() {
		$('#nav').toggleClass('open');
	});

	///////////////////////////
	// Mobile dropdown
	$('.has-dropdown a').on('click', function() {
		$(this).parent().toggleClass('open-drop');
	});

	///////////////////////////
	// On Scroll
	$(window).on('scroll', function() {
		var wScroll = $(this).scrollTop();

		// Fixed nav
		wScroll > 1 ? $('#nav').addClass('fixed-nav') : $('#nav').removeClass('fixed-nav');

		// Back To Top Appear
		wScroll > 700 ? $('#back-to-top').fadeIn() : $('#back-to-top').fadeOut();
	});

	///////////////////////////
	// magnificPopup
	$('.work').magnificPopup({
		delegate: '.lightbox',
		type: 'image'
	});

	///////////////////////////
	// Owl Carousel
	$('#about-slider').owlCarousel({
		items:1,
		loop:true,
		margin:15,
		nav: true,
		navText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
		dots : true,
		autoplay : true,
		animateOut: 'fadeOut'
	});

	$('#testimonial-slider').owlCarousel({
		loop:true,
		margin:15,
		dots : true,
		nav: false,
		autoplay : true,
		responsive:{
			0: {
				items:1
			},
			992:{
				items:2
			}
		}
	});

})(jQuery);

// For Search box
function ChangeColor() {
  var color = document.getElementById('myColor').value;
  document.getElementById('ColorCode').style.color = color;
  document.getElementById('search-button').style.background = color;
  document.getElementById("ColorCode").innerHTML = color;
}

// below search_view javascript

var doc = document,
	win = window,
	body = doc.body;

var map = L.map('map').setView([51.505, -0.09], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
	maxZoom: 18,
	attribution: '',
	id: 'mapbox.streets'
}).addTo(map);

var popup = L.popup();

var coords = [];
var markers = [];

var items = doc.getElementsByClassName('items__item');

setMap();

function setMap(){
	for (var i = 0; i < items.length; i++) {
		(function(i){
			var icon = L.divIcon({className: 'map__icon', html: '<span>'+items[i].getElementsByTagName('h3')[0].textContent+'</span>'});

			coords[i] = [items[i].getAttribute('data-lat'), items[i].getAttribute('data-lon')];
			markers[i] = L.marker(coords[i], {icon: icon}).addTo(map);

			markers[i].on('click', function(e){
				onMapClick(e, i);
			});
			items[i].setAttribute('data-id', i);
			items[i].addEventListener('click', onItemClick, true);
		})(i);
	}

	map.fitBounds(coords);
}

function onMapClick(e, i) {
	var item = items[i];

	removeSelected();

	win.scrollTo(0, item.offsetTop);
	item.classList.add('is-selected');
	map.panTo(e.latlng);
	popup.setLatLng(e.latlng);
	popup.setContent('<div class="popup">'+item.innerHTML+'</div>');
	popup.openOn(map);
}

function onItemClick(e) {
	var el = e.target;
	while (el && el.tagName !== 'LI') {
		el = el.parentNode;
	}
	removeSelected();
	el.classList.add('is-selected');
	map.panTo(coords[el.getAttribute('data-id')]);
}

function removeSelected(){
	var selected = doc.getElementsByClassName('is-selected')[0];
	if (!selected) return false;
	selected.classList.remove('is-selected');
}

// above search_view javascript
