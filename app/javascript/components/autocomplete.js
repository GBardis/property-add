const autoComplete = require("@tarekraafat/autocomplete.js/dist/js/autoComplete");
const autocompleteSearch = new autoComplete(
    {
    data: {
        src: async () => {
            // Loading placeholder text
            document
                .querySelector("#inputArea")
                .setAttribute("placeholder", "Loading...");
            // User search query
            const query = document.querySelector("#inputArea").value;
            // Fetch External Data Source
            const source = await fetch(`area_autocomplete?&query=${query}`);
            // Format data into JSON
            const data = await source.json();
            document
                .querySelector("#inputArea")
                .setAttribute("placeholder", "Type in the property's area");
            return data;
        },
        key: ["result", "place_id"],
        cache: false
    },
    selector: "#inputArea",
    threshold: 3,                        // Min. Chars length to start Engine | (Optional)
    debounce: 300,                       // Post duration for engine to start | (Optional)
    resultItem: {
        content: (data, element) => {
            // Modify Results Item Style
            element.style = "display: flex; justify-content: space-between;";
            // Modify Results Item Content
            element.innerHTML = `<span style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
        ${data.match}</span>
        <span style="display: flex; align-items: center; font-size: 13px; font-weight: 100; text-transform: uppercase; color: rgba(0,0,0,.2);">
      ${data.key}</span>`;
        }
    },
    noResults: (dataFeedback, generateList) => {
        // Generate autoComplete List
        generateList(autocompleteSearch, dataFeedback, dataFeedback.results);
        // No Results List Item
        const result = document.createElement("li");
        result.setAttribute("class", "no_result");
        result.setAttribute("tabindex", "1");
        result.innerHTML = `<span style="display: flex; align-items: center; font-weight: 100; color: rgba(0,0,0,.2);">Found No Results for "${dataFeedback.query}"</span>`;
        document
            .querySelector(`#${autocompleteSearch.resultsList.idName}`)
            .appendChild(result);
    },
    onSelection: (feedback) => {
        document.querySelector("#inputArea").blur();
        // Prepare User's Selected Value
        const selection = feedback.selection.value[feedback.selection.key];
        // Replace Area value with the selected value
        document.querySelector("#inputArea").value = selection;
        // Replace place id value with the selected value
        document.querySelector("#placeId").value = feedback.selection.value.place_id;
        // Console log autoComplete data feedback
        console.log(feedback);
    }
});

export {autocompleteSearch};