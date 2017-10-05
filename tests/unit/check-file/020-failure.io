======== IN ========
----IN----
foo bar
lorem ipsum
sit amet
----OUT----
sit amet
lorem ipsum
unexpected output line
foo bar
======== OUT ========
--- expected
+++ actual
@@ -5,5 +5,4 @@
 ----OUT----
 sit amet
 lorem ipsum
-unexpected output line
 foo bar
======== EXIT ========
1
