import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class MyTests {
    @Test
    void simpleTest() {
        int expected = 2 + 3;
        int actual = 6;
        assertEquals(expected, actual, "2 + 3 should equal 5");
    }
}
