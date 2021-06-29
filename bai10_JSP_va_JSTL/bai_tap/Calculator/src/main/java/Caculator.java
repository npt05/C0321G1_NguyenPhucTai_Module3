public class Caculator {
    public static float Caculate(float first, float second, char operator) {
        switch (operator) {
            case '+':
                return first + second;
            case '-':
                return first - second;
            case '*':
                return first * second;
            case '/':
                if (second == 0) throw new RuntimeException("Are you kidding me ?");
                else return first / second;
            default:
                throw new RuntimeException("Lỗi rồi bạn ơi");
        }
    }
}