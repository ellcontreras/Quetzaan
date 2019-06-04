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
//= require quill.min
//= require quill.global

var defaults = {
  theme: "snow",
  modules: {
    toolbar: [
      [{ header: [1, 2, 3, false] }],
      ["bold", "italic", "underline", "strike"],
      ["blockquote", "code-block", "image", "link"],
      [{ list: "ordered" }, { list: "bullet" }],
      [{ indent: "-1" }, { indent: "+1" }],
      ["clean"]
    ]
  }
};

//This is the global config object
Quilljs.setDefaults(defaults);

document.addEventListener("DOMContentLoaded", () => {
  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(
    document.querySelectorAll(".navbar-burger"),
    0
  );

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {
    // Add a click event on each of them
    $navbarBurgers.forEach(el => {
      el.addEventListener("click", () => {
        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle("is-active");
        $target.classList.toggle("is-active");
      });
    });
  }
});

var searchClient = algoliasearch(
  "DNAY66KGWV",
  "b78b16de41e0e3f75bbdd6a471fae704"
);

var search = instantsearch({
  indexName: "Product",
  searchClient,
  searchFunction(helper) {
    if (helper.state.query === "") {
      return;
    }

    helper.search();
  }
});

search.addWidget(
  instantsearch.widgets.searchBox({
    container: "#search_input",
    showLoadingIndicator: true,
    placeholder: "Ingresa tu busqueda..."
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: "#hits",
    templates: {
      empty:
        "<br /><p class='has-text-centered'><b>No hay resultados que mostrar</b></p>",
      item:
        "<li><a href=/products/{{{ objectID }}}>{{{  _highlightResult.name.value}}}</a></li>"
    },
    transformItems: items => items.map(item => item)
  })
);

search.start();
