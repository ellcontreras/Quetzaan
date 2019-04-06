// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require algolia/v3/algoliasearch.min
//= require jquery
//= require quill.min
//= require quill.global


var client = algoliasearch("DNAY66KGWV", "b78b16de41e0e3f75bbdd6a471fae704");
var index = client.initIndex('Product');
index.search('est', { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
        console.log(content.hits)
    })
    .catch(function searchFailure(err) {
        console.error(err);
    });


var defaults = {
    theme: 'snow',
    modules: {
        toolbar: [
            [{ 'header': [1, 2, 3, false] }],
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block', 'image', 'link'],
            [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            [{ 'indent': '-1'}, { 'indent': '+1' }],
            ['clean']
        ]
    }
};

//This is the global config object
Quilljs.setDefaults(defaults)
