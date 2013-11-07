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
          beforeBase: ['<%= cnf.base.lib %>/*'],
          beforeTests: ['<%= cnf.tests.lib %>/*'],
          afterBase: ['<%= cnf.base.build %>/*'],
          afterTests: ['<%= cnf.tests.build %>/*']
        },

        coffee: {
            base: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.base.src %>/',
                    src: ['*.coffee', '**/*.coffee'],
                    dest: '<%= cnf.base.build %>/',
                    ext: '.js'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.src %>/',
                    src: ['*.coffee', '**/*.coffee'],
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
                    src: ['*.js', '**/*.js'],
                    dest: '<%= cnf.base.lib %>/'
                }]
            },
            tests: {
                files: [{
                    expand: true,
                    cwd: '<%= cnf.tests.build %>/',
                    src: ['*.js', '**/*.js'],
                    dest: '<%= cnf.tests.lib %>/'
                }]
            }
        },

        watch: {
            base: {
                files: ['<%= cnf.base.src %>/**/*.coffee'],
                tasks: ['clean:beforeBase', 'coffee:base', 'uglify:base', 'clean:afterBase']
            },
            tests: {
                files: ['<%= cnf.tests.src %>/**/*.coffee'],
                tasks: ['coffee:tests', 'uglify:tests', 'clean:afterTests']
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['clean:beforeBase', 'clean:beforeTests', 'coffee', 'uglify',
                                   'clean:afterBase', 'clean:afterTests']);

};
