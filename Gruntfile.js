module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    workpath: {
      common: {
        css: 'wwwroot/Public/static/common/css',
        js: 'wwwroot/Public/static/',
      },
      public: {
        usercenter_less: 'wwwroot/Public/Usercenter/default/less',
        usercenter_css: 'wwwroot/Public/Usercenter/default/css',
        teacher_less: 'wwwroot/Public/Teacher/less',
        teacher_css: 'wwwroot/Public/Teacher/css',
        weixin_less: 'wwwroot/Public/weixin/less',
        weixin_css: 'wwwroot/Public/weixin/css',
      },
      App: 'wwwroot/Application',
    },

    jshint: {
      options: {
        globals: {
          jQuery: true,
          console: true,
          module: true
        }
      },

      files: ['<%= workpath.common.js %>/common.js'],
    },

    csslint: {
      options: {
         csslintrc: '.csslintrc'
       },
      common: [
        '<%= workpath.common.css %>/common.css',
      ], 
//      all: [
//        '<%= workpath.public %>/**/*.css',
//      ],
    },

    csscomb: {
      options: {
        config: '.csscomb.json'
      },
      common: {
        src: '<%= workpath.common.css %>/common.css',
        dest: '<%= workpath.common.css %>/common.css'
      }
    },

    less: {
      // 编译
      compile: {
        files: {
          '<%= workpath.common.css %>/common.css': '<%= workpath.common.css %>/common.less',
          '<%= workpath.public.usercenter_css %>/usercenter.css': '<%= workpath.public.usercenter_less %>/usercenter.less',
          '<%= workpath.public.teacher_css %>/teacher.css': '<%= workpath.public.teacher_less %>/teacher.less',
          '<%= workpath.public.weixin_css %>/weixin.css': '<%= workpath.public.weixin_less %>/weixin.less'
        }
      },
      // 压缩
      compress: {
        files: {
          '<%= workpath.common.css %>/common.min.css': '<%= workpath.common.css %>/common.css',
          '<%= workpath.public.usercenter_css %>/usercenter.min.css': '<%= workpath.public.usercenter_css %>/usercenter.css',
          '<%= workpath.public.teacher_css %>/teacher.min.css': '<%= workpath.public.teacher_css %>/teacher.css',
          '<%= workpath.public.weixin_css %>/weixin.min.css': '<%= workpath.public.weixin_css %>/weixin.css'
        },
        options: {
          compress: true
        }
      }
    },

    watch: {
      commoncss: {
        files: ['<%= workpath.common.css %>/*.less',
                '<%= workpath.public.usercenter_less %>/*.less',
                '<%= workpath.public.teacher_less %>/*.less',
                '<%= workpath.public.weixin_less %>/*.less'
                ],
        tasks: ['common-css'],
      },
      js: {
        files: ['<%= jshint.files %>'],
        tasks: ['jshint'],
      }
    }
  });

  // Load the plugin
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-csslint');
  grunt.loadNpmTasks('grunt-csscomb');
  //由于recess长时间没有更新，所以只用于优化检测，
  //使用grunt-contrib-less编译和压缩
  grunt.loadNpmTasks('grunt-recess');

  // Default task(s).
  grunt.registerTask('default', ['watch']);
  grunt.registerTask('lint-js', ['jshint']);
  grunt.registerTask('lint-css', ['csslint']);
  grunt.registerTask('lint-common', ['lint-js', 'lint-css']);
  grunt.registerTask('common-css', ['less','csscomb:common']);
};