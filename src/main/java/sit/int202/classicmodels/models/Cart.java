package sit.int202.classicmodels.models;

import java.text.DecimalFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import static java.lang.Math.round;

public class Cart<K, V extends CartItem> {
    private final Map<K, V> map;

    public Cart() {
        this.map = new HashMap<>();
    }

    public int getNoOfItem() {
        return map.size();
    }

    public int getQuantity() {
        return map.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public Collection<V> getAllItem() {
        return Collections.unmodifiableCollection(map.values());
    }

    public void addItem(K key, V value) {
        V item = map.get(key);
        if (item == null) {
            map.put(key, value);
        } else {
            item.setQuantity(item.getQuantity() + value.getQuantity());
        }
    }

    public V removeItem(K key) {
        return map.remove(key);
    }

    public void clear() {
        map.clear();
    }

    public String getTotalPrice() {
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(getAllItem().stream().mapToDouble(CartItem::getTotal).sum());
    }
}