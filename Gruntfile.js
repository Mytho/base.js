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
          base: ['<%= cnf.base.lib %>/*', '<%= cnf.base.build %>/*'],
          tests: ['<%= cnf.tests.lib %>/*', '<%= cnf.tests.build %>/*']
        },

        coffee: {
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.base.src %>/',
                    src: ['**/*.coffee'],
                    dest: '<%= cnf.base.build %>/',
                    ext: '.js'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.src %>/',
                    src: ['**/*.coffee', '!example.config.coffee'],
                    dest: '<%= cnf.tests.build %>/',
                    ext: '.js'
                }]
            }
        },

        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> ~ Released under <%= pkg.license %> license ~ Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %> */\n'
            },
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.base.build %>/',
                    src: ['**/*.js'],
                    dest: '<%= cnf.base.lib %>/'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.build %>/',
                    src: ['**/*.js'],
                    dest: '<%= cnf.tests.lib %>/'
                }]
            }
        },

        watch: {
            base: {
                files: ['<%= cnf.base.src %>/**/*.coffee'],
                tasks: ['clean:base', 'coffee:base', 'uglify:base']
            },
            tests: {
                files: ['<%= cnf.tests.src %>/**/*.coffee'],
                tasks: ['clean:tests', 'coffee:tests', 'uglify:tests']
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['clean', 'coffee', 'uglify']);

};
