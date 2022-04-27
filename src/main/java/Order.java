import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.LinkedList;

public class Order {

    private List<Drink> contents = new LinkedList<>();
    private String owner;
    private String recipient;
    private double taxes = 0.0;

    public void setOwner(String who) { this.owner = who; }
    public void setRecipient(String who) { this.recipient = who; }

    public List<Order.Drink> getDrinks() { return contents; }

    public void setTaxes(double rate) { this.taxes = rate; }

    public double computePrice(Catalogue catalogue){
        return this.getDrinks().stream()
                .map(d -> catalogue.getPrice(d.getName()))
                .reduce(0.0, Double::sum);
    }

    public double computePriceWithTaxes(Catalogue catalogue){
        return new BigDecimal(this.computePrice(catalogue) * taxes)
                .setScale(2, RoundingMode.HALF_EVEN)
                .doubleValue();
    }

    @Override
    public String toString() {
        return "Order: " + owner + " / " + recipient + " / { " + contents + "}";
    }

    static class Drink {
        public Drink(String name){ this.name = name; }
        private String name;
        public String getName() { return name; }
        @Override public String toString() { return name; }
    }

}