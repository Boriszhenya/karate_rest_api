package karate;

import com.intuit.karate.junit5.Karate;

class KarateRunner {

    @Karate.Test
    Karate testsRun() {
        return Karate.run().relativeTo(getClass());
    }

}