// Feather disable all

testA = "no tags";
testB = "one [tag] tag";
testC = "[tag]start tag";
testD = "end tag [tag]";
testE = "two [tagA] tags [tagB]";
testF = "adjacent [tagA][tagB] tags";
testG = "escaped [[tag] tag";
testH = "unterminated [tag";
testI = "";
testJ = "[tag]";
testK = "[tag";
testL = "double [tag]] close";
testM = "escape [[[tag] and tag";

splitA = StringSplit(testA, "[");
splitB = StringSplit(testB, "[");
splitC = StringSplit(testC, "[");
splitD = StringSplit(testD, "[");
splitE = StringSplit(testE, "[");
splitF = StringSplit(testF, "[");
splitG = StringSplit(testG, "[");
splitH = StringSplit(testH, "[");
splitI = StringSplit(testI, "[");
splitJ = StringSplit(testJ, "[");
splitK = StringSplit(testK, "[");
splitL = StringSplit(testL, "[");
splitM = StringSplit(testM, "[");

Trace("\"", testA, "\" = ", splitA, " = \"", StringJoin(splitA), "\"");
Trace("\"", testB, "\" = ", splitB, " = \"", StringJoin(splitB), "\"");
Trace("\"", testC, "\" = ", splitC, " = \"", StringJoin(splitC), "\"");
Trace("\"", testD, "\" = ", splitD, " = \"", StringJoin(splitD), "\"");
Trace("\"", testE, "\" = ", splitE, " = \"", StringJoin(splitE), "\"");
Trace("\"", testF, "\" = ", splitF, " = \"", StringJoin(splitF), "\"");
Trace("\"", testG, "\" = ", splitG, " = \"", StringJoin(splitG), "\"");
Trace("\"", testH, "\" = ", splitH, " = \"", StringJoin(splitH), "\"");
Trace("\"", testI, "\" = ", splitI, " = \"", StringJoin(splitI), "\"");
Trace("\"", testJ, "\" = ", splitJ, " = \"", StringJoin(splitJ), "\"");
Trace("\"", testK, "\" = ", splitK, " = \"", StringJoin(splitK), "\"");
Trace("\"", testL, "\" = ", splitL, " = \"", StringJoin(splitL), "\"");
Trace("\"", testM, "\" = ", splitM, " = \"", StringJoin(splitM), "\"");