package app;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class MainTest {
    @Test
    void simpleTest() {
        int expected = 2 + 3;
        int actual = 5;
        assertEquals(expected, actual, "2 + 3 should equal 5");
    }
}
