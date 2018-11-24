﻿/**
* This jQuery plugin displays pagination links inside the selected elements.
*
* @author Gabriel Birke (birke *at* d-scribe *dot* de)
* @version 1.2
* @param {int} maxentries Number of entries to paginate
* @param {Object} opts Several options (see README for documentation)
* @return {Object} jQuery Object
*/
jQuery.fn.pagination = function (maxentries, opts) {
    opts = jQuery.extend({
        items_per_page: 10,
        num_display_entries: 5,
        current_page: 0,
        num_edge_entries: 1,
        link_to: "#",
        prev_text: "<",
        next_text: ">",
        ellipse_text: "...",
        prev_show_always: true,
        next_show_always: true,
        isshowclickme: false,
        callback: function () { return true; }
    }, opts || {});
    return this.each(function () {
        /**
        * Calculate the maximum number of pages
        */
        function numPages() {
            return Math.ceil(maxentries / opts.items_per_page);
        }

        /**
        * Calculate start and end point of pagination links depending on 
        * current_page and num_display_entries.
        * @return {Array}
        */
        function getInterval() {
            var ne_half = Math.ceil(opts.num_display_entries / 2);
            var np = numPages();
            var upper_limit = np - opts.num_display_entries;
            var start = current_page > ne_half ? Math.max(Math.min(current_page - ne_half, upper_limit), 0) : 0;
            var end = current_page > ne_half ? Math.min(current_page + ne_half, np) : Math.min(opts.num_display_entries, np);
            return [start, end];
        }

        /**
        * This is the event handling function for the pagination links. 
        * @param {int} page_id The new page number
        */
        function pageSelected(page_id, evt) {
            current_page = page_id;
            drawLinks();
            var continuePropagation = opts.callback(page_id, panel);
            if (!continuePropagation) {
                if (evt.stopPropagation) {
                    evt.stopPropagation();
                }
                else {
                    evt.cancelBubble = true;
                }
            }
            //            if (current_page == 0) {
            //                $(".pagination .prev").hide();
            //                $(".pagination .next").show();
            //            } else if (current_page == maxentries - 1) {
            //                $(".pagination .next").hide();
            //                $(".pagination .prev").show();
            //            } else if (current_page == 0 && maxentries == 1) {
            //                $(".pagination .prev").hide();
            //                $(".pagination .next").hide();
            //            }
            return continuePropagation;
        }

        /**
        * This function inserts the pagination links into the container element
        */

        function drawLinks() {
            panel.empty();
            var interval = getInterval();
            var np = numPages();
            // This helper function returns a handler function that calls pageSelected with the right page_id
            var getClickHandler = function (page_id) {
                return function (evt) { return pageSelected(page_id, evt); }
            }
            var turnTo = function () {
                var pageNo = $("#pageIdex").val();
                if (pageNo <= numPages() && pageNo > 0) {
                    window.location.href = opts.link_to.replace(/__id__/, pageNo);;
                } else {
                    alert("您输入的页码有误!");
                }
            }
            // Helper function for generating a single link (or a span tag if it's the current page)
            var appendItem = function (page_id, appendopts) {
                page_id = page_id < 0 ? 0 : (page_id < np ? page_id : np - 1); // Normalize page id to sane value
                appendopts = jQuery.extend({ text: page_id + 1, classes: "" }, appendopts || {});
                if (page_id == current_page) {
                    var lnk = jQuery("<a class='current'>" + (appendopts.text) + "</a>");
                }
                else {
                    var lnk = jQuery("<a>" + (appendopts.text) + "</a>")
						.bind("click", getClickHandler(page_id))
						.attr('href', opts.link_to.replace(/__id__/, page_id + 1));
                }
                if (appendopts.classes) { lnk.addClass(appendopts.classes); }
                panel.append(lnk);
            }
            // Generate "Previous"-Link
            if (opts.prev_text && (current_page > 0 || opts.prev_show_always)) {
                appendItem(current_page - 1, { text: opts.prev_text, classes: "prev" });
            }
            // Generate starting points
            if (interval[0] > 0 && opts.num_edge_entries > 0) {
                var end = Math.min(opts.num_edge_entries, interval[0]);
                for (var i = 0; i < end; i++) {
                    appendItem(i);
                }
                if (opts.num_edge_entries < interval[0] && opts.ellipse_text) {
                    jQuery("<a>" + opts.ellipse_text + "</a>").appendTo(panel);
                }
            }
            // Generate interval links
            for (var i = interval[0]; i < interval[1]; i++) {
                appendItem(i);
            }
            // Generate ending points
            if (interval[1] < np && opts.num_edge_entries > 0) {
                if (np - opts.num_edge_entries > interval[1] && opts.ellipse_text) {
                    jQuery("<a>" + opts.ellipse_text + "</a>").appendTo(panel);
                }
                var begin = Math.max(np - opts.num_edge_entries, interval[1]);
                for (var i = begin; i < np; i++) {
                    appendItem(i);
                }
            }
            // Generate "Next"-Link
            if (opts.next_text && (current_page < np - 1 || opts.next_show_always)) {
                appendItem(current_page + 1, { text: opts.next_text, classes: "next" });
            }
            var next = $('.next');
            if (next != null && next != 'undefined') {
                var html = "<span id='clickme' style='   width: 74px;height: 70px;  position: relative;  margin: 0 6px 0 0;'><img  src='/images/dwyjx.png' style=' position: absolute;  left: 0;top: 6px;  cursor: pointer;' ></span><span class='pagination_font_color'>&nbsp;&nbsp;";
                //共<span> + numPages() + </span>页
                html += "跳至&nbsp;<input style='width: 35px;height: 35px; text-align: center; color: #333;border:1px solid #d9d9d9;' type='text' value='" + (current_page + 1) + "' id='pageIdex' />&nbsp;页&nbsp;&nbsp;";
                html += "<a id='turnTo' href='javascript:' style='width:55px;height:35px;background:#fff;border:1px solid #d9d9d9;color:#333;'>确定</a></span>";
                next.after(html);
                $("#clickme").bind("click", function () {
                    var url = $(".next").attr("href");
                    if (url != null)
                        location.href = url;
                });
                if (!opts.isshowclickme) {
                    $("#clickme").hide();
                }
                $("#turnTo").bind("click", turnTo);
                $("#turnTo").addClass("next");
                $("#turnTo").mouseenter(function() {
                    $(this).css({ "border": "1px solid #f25f55", "color": "#f25f55" });
                });
                $("#turnTo").mouseleave(function () {
                    $(this).css({ "border": "1px solid #d9d9d9", "color": "#333" });
                });
            }
        }

        // Extract current_page from options
        var current_page = opts.current_page;
        // Create a sane value for maxentries and items_per_page
        maxentries = (!maxentries || maxentries < 0) ? 1 : maxentries;
        opts.items_per_page = (!opts.items_per_page || opts.items_per_page < 0) ? 1 : opts.items_per_page;
        // Store DOM element for easy access from all inner functions
        var panel = jQuery(this);
        // Attach control functions to the DOM element 
        this.selectPage = function (page_id) { pageSelected(page_id); }
        this.prevPage = function () {
            if (current_page > 0) {
                pageSelected(current_page - 1);
                return true;
            }
            else {
                return false;
            }
        }
        this.nextPage = function () {
            if (current_page < numPages() - 1) {
                pageSelected(current_page + 1);
                return true;
            }
            else {
                return false;
            }
        }
        // When all initialisation is done, draw the links
        drawLinks();
        // call callback function
        opts.callback(current_page, this);
    });
}


