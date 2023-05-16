$(document).ready(function() {
	
	// Hide all accordion content initially
        $(".accordion-content").hide();
        
    // Handle accordion functionality
    $('.accordion').click(function() {
        // Toggle the arrow icon and toggle the accordion state
        $(this).find('.arrow').text(function(_, text) {
            return text === '▼' ? '▶' : '▼';
        });
        $(this).toggleClass('opened');
        $(this).next('.accordion-content').slideToggle();
    });
});
