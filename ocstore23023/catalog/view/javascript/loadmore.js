'use strict';

(function() {
	document.addEventListener('DOMContentLoaded', function () {
		var loadmore = document.getElementById('loadmore');
		var paginationParent = document.querySelector(loadmore.attributes['data-pag-selector'].value);

		if (paginationParent) {

			var hidePagination = Number(loadmore.attributes['data-hide-pag'].value);
			var hideResult = Number(loadmore.attributes['data-hide-result'].value);
			var pagination = paginationParent ? paginationParent.children[0] : null;
			var preloader = document.getElementById('loadmore-preloader');
			var nextLink = document.querySelector('.pagination li.active') ? document.querySelector('.pagination li.active').nextElementSibling : null;

			if (hidePagination) {
				paginationParent.style.visibility = 'hidden';
			}
			if (hideResult) {
			 	paginationParent.nextElementSibling.style.visibility = 'hidden';
			}
			if (hidePagination && hideResult) {
				paginationParent.style.display = 'none';
				paginationParent.nextElementSibling.style.display = 'none';
			}
			if (!nextLink) {
				return hideLoadMoreAndBreak();
			}

			/*----- Functions block -----*/
			function createLayout() {
				var col = document.createElement('DIV');
				col.className = 'loadmore-block col-xs-12 text-center';
				col.setAttribute('style', 'padding-top:15px');
				col.appendChild(loadmore);
				col.appendChild(preloader);
				paginationParent.parentElement.appendChild(col);
			}

			function hideLoadMoreAndBreak() {
				loadmore.parentElement.style.display = 'none';
			}

			function setGridOrList() {
				var layout = window.localStorage.display;
				var grid = document.getElementById('grid-view');
				var list = document.getElementById('list-view');
				if (layout === 'grid') {
					grid.click();
				}else {
					list.click();
				}
			}
			
			function setCurrentPageInPagination(arg) {
				var paginationBlock = document.getElementsByClassName('pagination')[0].parentElement;
				var newPagination = arg.querySelector('.pagination');
				paginationBlock.innerHTML = '';
				paginationBlock.appendChild(newPagination);
			}
			
			function setCurrentResult() {
				var resultToShow = Number(document.getElementById('input-limit')[0].innerText);
				var resultBlock = document.getElementsByClassName('pagination')[0].parentElement.nextElementSibling;
				var results = resultBlock.innerText.split(' ');
				results[3] = Number(results[3]) + resultToShow > Number(results[5]) ? Number(results[5]) : Number(results[3]) + resultToShow;
				var newResult = results.join(' ');
				resultBlock.innerText = '';
				resultBlock.innerText = newResult;
			}
			/*----- The end of functions block -----*/

			createLayout();

			loadmore.addEventListener('click', function (e) {
				e.preventDefault();
				nextLink = document.querySelector('.pagination li.active').nextElementSibling;
				var href = nextLink ? nextLink.querySelector('a').attributes[0].value : null;
				var content = document.getElementsByClassName('product-layout')[0].parentElement;
				
				if (href) {
					$.ajax({
						url: href,
						method: 'POST',
						beforeSend: function() {
							loadmore.style.opacity = 0;
							preloader.style.opacity = 1;
						},
						complete: function() {
							loadmore.style.opacity = 1;
							preloader.style.opacity = 0;
						},
						success: function(data) {
							var parser = new DOMParser();
							var doc = parser.parseFromString(data, 'text/html');
							var products = [].slice.call(doc.getElementsByClassName('product-layout')[0].parentElement.children);
							products.forEach(function (item) {
								content.appendChild(item);
							})
							setGridOrList();
							setCurrentPageInPagination(doc);
							if (!hideResult) {
								setCurrentResult();
							}
							if (!document.querySelector('.pagination li.active').nextElementSibling) {
								hideLoadMoreAndBreak();
							}
						},
						error: function() {
							alert('Sorry, the error occured and we can\'t');
						}
					});
				}
			});
		}
	});
})();