/*global module:false*/
module.exports = function(grunt) {
  require('lineman').config.grunt.run(grunt);

  grunt.registerTask('server', 'Custom Express Server', function() {
    grunt.log.writeln('Starting express web server in "./generated" on port 8000');
    require(process.cwd() + '/config/server.js').listen(process.env.WEB_PORT || 8000);
  });
};