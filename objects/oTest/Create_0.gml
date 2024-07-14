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

decompA = TextFormDecompose(testA);
decompB = TextFormDecompose(testB);
decompC = TextFormDecompose(testC);
decompD = TextFormDecompose(testD);
decompE = TextFormDecompose(testE);
decompF = TextFormDecompose(testF);
decompG = TextFormDecompose(testG);
decompH = TextFormDecompose(testH);
decompI = TextFormDecompose(testI);
decompJ = TextFormDecompose(testJ);
decompK = TextFormDecompose(testK);
decompL = TextFormDecompose(testL);
decompM = TextFormDecompose(testM);

Trace("\"", testA, "\" = ", decompA, " = \"", TextFormRecompose(decompA), "\"");
Trace("\"", testB, "\" = ", decompB, " = \"", TextFormRecompose(decompB), "\"");
Trace("\"", testC, "\" = ", decompC, " = \"", TextFormRecompose(decompC), "\"");
Trace("\"", testD, "\" = ", decompD, " = \"", TextFormRecompose(decompD), "\"");
Trace("\"", testE, "\" = ", decompE, " = \"", TextFormRecompose(decompE), "\"");
Trace("\"", testF, "\" = ", decompF, " = \"", TextFormRecompose(decompF), "\"");
Trace("\"", testG, "\" = ", decompG, " = \"", TextFormRecompose(decompG), "\"");
Trace("\"", testH, "\" = ", decompH, " = \"", TextFormRecompose(decompH), "\"");
Trace("\"", testI, "\" = ", decompI, " = \"", TextFormRecompose(decompI), "\"");
Trace("\"", testJ, "\" = ", decompJ, " = \"", TextFormRecompose(decompJ), "\"");
Trace("\"", testK, "\" = ", decompK, " = \"", TextFormRecompose(decompK), "\"");
Trace("\"", testL, "\" = ", decompL, " = \"", TextFormRecompose(decompL), "\"");
Trace("\"", testM, "\" = ", decompM, " = \"", TextFormRecompose(decompM), "\"");