module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    },

    less: {
      // 编译
      compile: {
        files: {
          'wwwroot/Public/static/common/css/common.css': 'wwwroot/Public/static/common/css/common.less'
        }
      },
      // 压缩
      yuicompress: {
        files: {
          'common.min.css': 'common.css'
        },
        options: {
          yuicompress: false
        }
      }
    },
    watch: {
      scripts: {
        files: ['wwwroot/Public/static/common/**/*.less'],
        tasks: ['less'] }
    }
  });

  // Load the plugin that provides the "uglify" task.
  //grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  //grunt.registerTask('default', ['uglify']);
  grunt.registerTask('default', ['less', 'watch']);
};