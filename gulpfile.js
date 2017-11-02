const gulp = require('gulp');
const watch = require('gulp-watch');
const runSequence = require('run-sequence');

gulp.task('default', () => (
	runSequence(
		'copy',
		'watch'
	)
));

gulp.task('copy', () => {
	gulp.src('dev/**/*')
		.pipe(gulp.dest('.'))
});

gulp.task('watch', () => {
	watch('dev/**/*', () => runSequence('copy'))
});