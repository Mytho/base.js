module.exports = function(grunt) {

    grunt.initConfig({

        cnf: {
            build: 'build',
            src: 'src',
            lib: 'lib'
        },

        pkg: grunt.file.readJSON('package.json'),

        clean: {
          build: ['<%= cnf.build %>/*'],
          lib: ['<%= cnf.lib %>/*']
        },

        coffee: {
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.src %>/',
                    src: '**/*.coffee',
                    dest: '<%= cnf.build %>/',
                    ext: '.js'
                }]
            }
        },

        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> ~ Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %> ~ Released under <%= pkg.license %> license */\n'
            },
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.build %>/',
                    src: '*/**.js',
                    dest: '<%= cnf.lib %>/'
                }]
            }
        },

        watch: {
            base: {
                files: ['<%= cnf.src %>/**/*.coffee'],
                tasks: ['coffee:base', 'uglify:base', 'clean:build']
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['clean:lib', 'coffee:base', 'uglify:base', 'clean:build']);

};
