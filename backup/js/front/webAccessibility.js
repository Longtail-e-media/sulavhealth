$(document).ready(function() {
    // device detection
    var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
    if (iOS) {
        return;
    }

    $('.modal-webAccessibility img').keypress(function(event) {
        if (event.keyCode == 13) {
            $(this).click();
        }
    });

    $('.webAccessBtn').click(function() {
        var tabbableElements = $('.modal-webAccessibility').find('img');
        setupModalEvents(tabbableElements);
        disableTabbingOnPage(tabbableElements);
        enableTabbingOnModal(tabbableElements);

        // $('#exampleModal').modal();
        $('#exampleModal').toggle('show');
    })

    function setupModalEvents(tabbableElements) {
        var elementWithFocus = $(':focus');
        //on modal open
        $(document).on('shown.bs.modal', function() {
            focusFirstInputElement();
        });
        //on modal close
        $(document).on('hidden.bs.modal', function() {
            reEnableTabbingOnPage(tabbableElements);
            $(elementWithFocus).focus();
        })
    }

    function disableTabbingOnPage(tabbableElements) {
        $.each(tabbableElements, function(index, element) {
            $(element).attr('tabindex', '-1');
        })
    }

    function enableTabbingOnModal(tabbableElements) {
        $.each(tabbableElements, function(index, element) {
            if ($(element).parents('.modal').length) {
                //element is inside of the modal
                $(element).attr('tabindex', '0');
            }
        })
    }

    function reEnableTabbingOnPage(tabbableElements) {
        $.each(tabbableElements, function(index, element) {
            $(element).attr('tabindex', '0');
        })
    }

    function focusFirstInputElement() {
        var inputElements = $('input');
        $.each(inputElements, function(index, element) {
            if ($(element).parents('.modal').length) {
                $(element).focus();
                //end loop
                return false;
            }
        })
    }



    setTimeout(function() {
        $('body').attr('style', 'zoom: 100%')
        $('body').attr('zoom', '100')
        // $('html').attr('style', '-webkit-filter: contrast(100%)')
        $('html').attr('contrast', '100')
        // $('html').attr('style', '-webkit-filter: invert(0%)')
        $('html').attr('invert', false)
        var fontSize = 15;
        $(".resetFont2").click(function() {
            $('*').each(function() {
                $(this).removeClass(function(index, css) {
                    return (String(css).match(/(^|\s)fs-\S+/g) || []).join(' ');
                });
            });
            fontSize = 15;
        });
        $(".increaseFont").click(function() {
            var currentZoom = $('body').attr('zoom')
            var currentZoomNum = parseInt(currentZoom) + 20;
            var newFontSize = "zoom:" + currentZoomNum.toString() + "%";
            $('body').attr('style', newFontSize);
            $('body').attr('zoom', currentZoomNum.toString());
        });


        $(".decreaseFont").click(function() {
            var currentZoom = $('body').attr('zoom')
            var currentZoomNum = parseInt(currentZoom) - 20;
            if (currentZoomNum < 100) { currentZoomNum = 100 }
            var newFontSize = "zoom:" + currentZoomNum.toString() + "%";
            $('body').attr('style', newFontSize);
            $('body').attr('zoom', currentZoomNum.toString());
        });
        $(".resetFont").click(function() {
            $("body").attr("style", "zoom: 100%"),
                $("body").attr("zoom", "100%")
        });

        $(".increaseFont2").click(function() {

            if (fontSize <= 20) {
                fontSize = fontSize + 1;
                $('*').each(function() {
                    if (parseInt($(this).css('font-size').split('p')[0]) < fontSize) {
                        $(this).removeClass(function(index, css) {
                            return (String(css).match(/(^|\s)fs-\S+/g) || []).join(' ');
                        });
                        $(this).addClass('fs-' + fontSize);
                    }
                });

            }
        });


        $(".decreaseFont2").click(function() {

            if (fontSize >= 15) {
                fontSize = fontSize - 1;
                $('*').each(function() {
                    if (parseInt($(this).css('font-size').split('p')[0]) > fontSize) {
                        $(this).removeClass(function(index, css) {
                            return (String(css).match(/(^|\s)fs-\S+/g) || []).join(' ');
                        });
                        $(this).addClass('fs-' + fontSize);
                    }
                });
            }
        });



        $(".resetContrast").click(function() {
            $('html').attr('style', '-webkit-filter: contrast(100%)')
            $('html').attr('contrast', '100')
        });

        $(".increaseContrast").click(function() {
            var test2 = $('html').attr('contrast')
            var currentZoomNumIncrease = parseInt(test2) + 20;
            var newFontSize = '-webkit-filter: contrast(' + currentZoomNumIncrease.toString() + '%);';
            $('html').attr('style', newFontSize);
            $('html').attr('contrast', currentZoomNumIncrease.toString());
        });

        $(".decreaseContrast").click(function() {
            var test2 = $('html').attr('contrast')
            var currentZoomNumDecrease = parseInt(test2) - 20;
            if (currentZoomNumDecrease < 100) { currentZoomNumDecrease = 100 }
            var newFontSize = '-webkit-filter: contrast(' + currentZoomNumDecrease.toString() + '%);';
            $('html').attr('style', newFontSize);
            $('html').attr('contrast', currentZoomNumDecrease.toString());
        });

        function changeTextBackground(backgroundColor, textColor) {

            setTimeout(function() {
                $('div').each(function() {
                    if (!$(this).hasClass("modal")) {
                        $(this).removeClass(modifierClassMatcherBack);
                        $(this).addClass(backgroundColor);
                    }
                });
                $('*').each(function() {
                    $(this).removeClass(modifierClassMatcherText);
                    $(this).addClass(textColor);
                });

                $('.header__heading-bar__search').find('div').removeClass(modifierClassMatcherBack);
                $('.header__heading-bar__search').find('*').removeClass(modifierClassMatcherText);

                $('.header__toolbar__right').removeClass(modifierClassMatcherBack);

                $('.header__toolbar__accessibility').find('div').removeClass(modifierClassMatcherBack);
                $('.header__toolbar__accessibility').find('*').removeClass(modifierClassMatcherText);
                $('body').addClass(backgroundColor);
            }, 10);
        }

        function modifierClassMatcherBack(index, className) {
            var matchedClasses = String(className).match(/(^|\s)webAccBack\S+/g)
            return (matchedClasses || []).join('')
        }

        function modifierClassMatcherText(index, className) {
            var matchedClasses = String(className).match(/(^|\s)webAccText\S+/g)
            return (matchedClasses || []).join('')
        }



        $(".blackWhiteBtn").click(function() {
            changeTextBackground('webAccBackgroundBlack', 'webAccTextWhite');
        });

        $(".greyBlackBtn").click(function() {
            changeTextBackground('webAccBackgroundGrey', 'webAccTextBlack');
        });

        $(".yellowBlackBtn").click(function() {
            changeTextBackground('webAccBackgroundYellow', 'webAccTextBlack');
        });

        $(".blackYellowBtn").click(function() {
            changeTextBackground('webAccBackgroundBlack', 'webAccTextYellow');
        });

        $(".defaultBtn").click(function() {
            $('*').removeClass(modifierClassMatcherBack);
            $('*').removeClass(modifierClassMatcherText);

        });


        $(".btnRevertClick").click(function() {
            var test3 = $('html').attr('invert')
            var invert = '-webkit-filter: invert(200%)!important; filter: invert(200%)!important';
            var invert100 = '-webkit-filter: invert(0%)!important; filter: invert(0%)!important';
            if (test3 == 'false') {
                $('html').attr('style', invert);
                $('html').attr('invert', true);
            } else {
                $('html').attr('style', invert100);
                $('html').attr('invert', false);
            }

        });

    }, 500);

    function handleFirstTab(e) {
        if (e.keyCode === 9) {
            document.body.classList.add('user-is-tabbing');

            window.removeEventListener('keydown', handleFirstTab);
            window.addEventListener('mousedown', handleMouseDownOnce);
        }
    }

    function handleMouseDownOnce() {
        document.body.classList.remove('user-is-tabbing');

        window.removeEventListener('mousedown', handleMouseDownOnce);
        window.addEventListener('keydown', handleFirstTab);
    }

    window.addEventListener('keydown', handleFirstTab);
    var self = this;
    $(this.rootNode).on('click', 'li.current > a', function(e) {
        e.preventDefault();
        self.toggleOpen();
    });

    $('body').on('click', function(e) {
        if ($(self.rootNode).hasClass('open') && $(e.target).closest(self.rootNode).length == 0) {
            self.close();
        }
    });

    function toggleOpen() {
        $(this.rootNode).toggleClass('open');
    }

    function open() {
        $(this.rootNode).addClass('open');
    }

    function close() {
        $(this.rootNode).removeClass('open');
    }

});