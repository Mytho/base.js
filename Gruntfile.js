module.exports = function(grunt) {

    grunt.initConfig({

        cnf: {
            base: {
                build: 'base/build',
                src: 'base/src',
                lib: 'base/lib'
            },
            tests: {
                build: 'tests/build',
                src: 'tests/src',
                lib: 'tests/lib'
            }
        },

        pkg: grunt.file.readJSON('package.json'),

        clean: {
          before: ['<%= cnf.base.lib %>/*', '<%= cnf.tests.lib %>/*'],
          after: ['<%= cnf.base.build %>/*', '<%= cnf.tests.build %>/*']
        },

        coffee: {
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.base.src %>/',
                    src: '**/*.coffee',
                    dest: '<%= cnf.base.build %>/',
                    ext: '.js'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.src %>/',
                    src: '**/*.coffee',
                    dest: '<%= cnf.tests.build %>/',
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
                    cwd: '<%= cnf.base.build %>/',
                    src: '*/**.js',
                    dest: '<%= cnf.base.lib %>/'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.build %>/',
                    src: '*/**.js',
                    dest: '<%= cnf.tests.lib %>/'
                }]
            }
        },

        watch: {
            base: {
                files: ['<%= cnf.base.src %>/**/*.coffee'],
                tasks: ['coffee:base', 'uglify:base', 'clean:after']
            },
            tests: {
                files: ['<%= cnf.tests.src %>/**/*.coffee'],
                tasks: ['coffee:tests', 'uglify:tests', 'clean:after']
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['clean:before', 'coffee', 'uglify', 'clean:after']);

};
