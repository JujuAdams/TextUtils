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

//decompA = TextFormattedDecompose(testA);
//decompB = TextFormattedDecompose(testB);
//decompC = TextFormattedDecompose(testC);
//decompD = TextFormattedDecompose(testD);
//decompE = TextFormattedDecompose(testE);
//decompF = TextFormattedDecompose(testF);
//decompG = TextFormattedDecompose(testG);
//decompH = TextFormattedDecompose(testH);
//decompI = TextFormattedDecompose(testI);
//decompJ = TextFormattedDecompose(testJ);
//decompK = TextFormattedDecompose(testK);
//decompL = TextFormattedDecompose(testL);
//decompM = TextFormattedDecompose(testM);
//
//Trace("\"", testA, "\" = ", decompA, " = \"", TextFormattedRecompose(decompA), "\"");
//Trace("\"", testB, "\" = ", decompB, " = \"", TextFormattedRecompose(decompB), "\"");
//Trace("\"", testC, "\" = ", decompC, " = \"", TextFormattedRecompose(decompC), "\"");
//Trace("\"", testD, "\" = ", decompD, " = \"", TextFormattedRecompose(decompD), "\"");
//Trace("\"", testE, "\" = ", decompE, " = \"", TextFormattedRecompose(decompE), "\"");
//Trace("\"", testF, "\" = ", decompF, " = \"", TextFormattedRecompose(decompF), "\"");
//Trace("\"", testG, "\" = ", decompG, " = \"", TextFormattedRecompose(decompG), "\"");
//Trace("\"", testH, "\" = ", decompH, " = \"", TextFormattedRecompose(decompH), "\"");
//Trace("\"", testI, "\" = ", decompI, " = \"", TextFormattedRecompose(decompI), "\"");
//Trace("\"", testJ, "\" = ", decompJ, " = \"", TextFormattedRecompose(decompJ), "\"");
//Trace("\"", testK, "\" = ", decompK, " = \"", TextFormattedRecompose(decompK), "\"");
//Trace("\"", testL, "\" = ", decompL, " = \"", TextFormattedRecompose(decompL), "\"");
//Trace("\"", testM, "\" = ", decompM, " = \"", TextFormattedRecompose(decompM), "\"");