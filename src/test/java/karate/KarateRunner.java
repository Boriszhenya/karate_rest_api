package karate;
import com.intuit.karate.junit5.Karate;

class KarateRunner {

    @Karate.Test
    Karate testsAllRun() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testsOneFeatureRun() {
        return Karate.run("Articles.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testsDebug() {

        return Karate.run().tags("@debug").relativeTo(getClass());
    }
}