package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents currency values in the game's monetary system.
 * <p>
 * The currency system consists of five coin types:
 * Copper Pieces (CP), Silver Pieces (SP), Electrum Pieces (EP),
 * Gold Pieces (GP), and Platinum Pieces (PP). Standard exchange
 * rates are 10 CP = 1 SP, 5 SP = 1 EP, 2 EP = 1 GP, 10 GP = 1 PP.
 * </p>
 */
@Entity
@Table(name = "coin_values")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CoinValueEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "copper_piece")
    private Integer cp;

    @Column(name = "silver_piece")
    private Integer sp;

    @Column(name = "electrum_piece")
    private Integer ep;

    @Column(name = "gold_piece")
    private Integer gp;

    @Column(name = "platinum_piece")
    private Integer pp;
}
