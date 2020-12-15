package JavaBean;

import java.util.Date;

public class Hon {
    private String cover;
    private String name;
    private String author;
    private int heat;
    private Date date;
    private String price;
    private int recommand;

    public void setRecommand(int recommand) {
        this.recommand = recommand;
    }

    public int getRecommand() {
        return recommand;
    }

    public String getCover() {
        return cover;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public int getHeat() {
        return heat;
    }

    public Date getDate() {
        return date;
    }

    public String getPrice() {
        return price;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setHeat(int heat) {
        this.heat = heat;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Hon{" +
                "cover='" + cover + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", heat=" + heat +
                ", date='" + date + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
