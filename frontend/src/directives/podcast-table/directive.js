appDirectives.directive('podcastTable',
	function(config) {
		console.log(config);

		function link(scope, element) {
			scope.columns = [];
			scope.parsedRows = [];

			scope.$watch(
				"rows",
				function(newValue, oldValue) {
					if (typeof newValue == 'object') {
						newValue.forEach(function(arrayRow) {
							arrayRow.forEach(function(row) {
								// console.log(row.image);
								if (row.image) {
									// console.log('row', row);
									row.value = config.backUrl + 'images/' + row.value;
								}

								if (row.action) {

								}

								scope.parsedRows.push([row]);
							})
						});
					}

					console.log(typeof newValue, scope.parsedRows);

				}
			);

			/*scope.rows.forEach(function(row) {
				if (row.image) {
					row.value = config.backUrl + 'images/' + row.value;
				}

				if (row.action) {

				}

				scope.parsedRows.push(row);
			});*/
		}

		return {
			restrict: 'E',
			scope: {
				rows: '=',
				columns: '='
			},
			templateUrl: config.clientUrl + 'directives/podcast-table/template.html',
			// template: "<p>cool</p>",
			link: link
		};
	}
);