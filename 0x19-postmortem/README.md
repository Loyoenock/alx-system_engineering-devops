# Post-Incident Analysis of ALX School's System Engineering & DevOps Project 0x19 Release

Following the rollout of **ALX School's System Engineering & Dev Ops Project 0x19**, an unexpected service disruption was observed on an isolated** Ubuntu 14.04** container that was hosting an Apache web server. During this incident, attempts to access the server through GET requests resulted in encountering 500 Internal Server Errors, whereas the anticipated response should have been an HTML file presenting a basic Holberton WordPress site.

## Investigation and Resolution Process
Conducted an examination of active processes using ps aux command. This revealed that both the root and www-data users had functional apache2 processes running.

Investigated the contents of the sites-available directory located within the /etc/apache2/ path. Confirmed that the web server was serving content stored in the /var/www/html/ directory.

Initiated a two-fold approach: a) Executed strace on the PID associated with the root Apache process in one terminal, and b) employed the curl command to query the server in another terminal. Unfortunately, the strace output did not yield any valuable insights.

Replicated the previous step, this time focusing on the PID linked to the www-data process. This effort bore fruit as the strace analysis highlighted an -1 ENOENT (No such file or directory) error encountered when attempting to access the file /var/www/html/wp-includes/class-wp-locale.phpp.

Undertook a systematic evaluation of files within the /var/www/html/ directory. Employed Vim's pattern matching functionality to locate the erroneous .phpp file extension, successfully pinpointing it within the wp-settings.php file (specifically on Line 137, within the statement require_once( ABSPATH . WPINC . '/class-wp-locale.php' );).

Rectified the issue by removing the extraneous trailing 'p' from the aforementioned line.

Executed another curl request against the server and received a favorable response with a status code of 200.

Developed a Puppet manifest designed to automate the resolution of this error in the future.

# Summary
In summary, the root cause of the disruption was a typographical error. Specifically, the WordPress application was encountering a critical error within the wp-settings.php file while attempting to load the file class-wp-locale.phpp. The correct filename, found in the wp-content directory of the application folder, was class-wp-locale.php. The corrective action consisted of a straightforward fix involving the removal of the erroneous trailing 'p'.

# Preventive Measures
It is important to note that this incident stemmed from an application error rather than a web server malfunction. To mitigate similar incidents in the future, the following preventative measures should be observed:

Rigorously test the application prior to deployment. Early testing would have detected and addressed this error before reaching the production environment.

In response to this incident, a Puppet manifest was authored (0x17-web_stack_debugging_3) to automate the resolution of identical errors should they arise again. This manifest replaces any instances of phpp extensions within the wp-settings.php file located at /var/www/html/ with php.

By adhering to these practices, the likelihood of such outages can be significantly reduced moving forward.
