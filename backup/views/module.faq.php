<?php

$faq_details = '';

if (defined('FAQ_PAGE')) {

    $faqs = Faq::find_all();

    if (!empty($faqs)) {
        $faq_details .= '
            <div class="accordion accordion-flush" id="accordionFlushExample">            
        ';

        foreach ($faqs as $i => $faq) {
            $collapsed = ($i == 0) ? '' : 'collapsed';
            $show = ($i == 0) ? 'show' : '';
            $faq_details .= '
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-heading' . $faq->id . '">
                        <button class="accordion-button '.$collapsed.'" type="button" data-bs-toggle="collapse"
                                data-bs-target="#flush-collapse' . $faq->id . '" aria-expanded="false"
                                aria-controls="flush-collapse' . $faq->id . '">
                            ' . (($lang == "gr") ? $faq->title_gr : $faq->title) . '
                        </button>
                    </h2>
                    <div id="flush-collapse' . $faq->id . '" class="accordion-collapse collapse '.$show.'"
                         aria-labelledby="flush-heading' . $faq->id . '" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            ' . (($lang == "gr") ? $faq->content_gr : $faq->content) . '
                        </div>
                    </div>
                </div>
            ';
        }

        $faq_details .= '
            </div>
        ';
    } else {
        $faq_details .= '<h3 class="text-center p-4">No FAQ Found</h3>';
    }
}

$jVars['module:faq:details'] = $faq_details;