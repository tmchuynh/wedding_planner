$(document).ready(function() {
    // Handle music type filtering
    $('#musicType').change(function() {
        const selectedType = $(this).val();
        if (selectedType) {
            // Hide all music rows
            $('.accordion').hide();
            
            // Show the music rows that match the selected type
            $(`.accordion[data-restrictions="${selectedType}"]`).show();
        } else {
            // Show all music rows when no type is selected
            $('.accordion').show();
        }
    });

    // Initial state of the filter
    $('#musicType').val('');

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