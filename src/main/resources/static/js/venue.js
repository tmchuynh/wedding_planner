$(document).ready(function() {
    // Handle food restriction filtering
    $('#foodRestriction').change(function() {
        const selectedRestriction = $(this).val();
        if (selectedRestriction) {
            // Close all accordions
            $('.accordion').removeClass('opened');
            $('.accordion .arrow').text('▶');
            $('.accordion-content').slideUp();

            $('.accordion').each(function() {
                const restrictions = $(this).data('restrictions');
                const hasMatchingFood = $(this).next('.accordion-content').find(`tr[data-restrictions*="${selectedRestriction}"]`).length > 0;
                
                // Show/hide the accordion based on the food items matching the selected restriction
                if (hasMatchingFood) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        } else {
            // Show all accordions when no restriction is selected
            $('.accordion').show();
        }
    });

    // Initial state of the filter
    $('#foodRestriction').val('');

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
