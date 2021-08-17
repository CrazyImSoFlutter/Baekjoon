import Foundation

let HAHA = readLine()!.split(separator: " ").map { Int(String($0))! }
let PS = readLine()!.split(separator: " ").map { Int(String($0))! }
var HeroHP = HAHA[0]
let HeroAttack = HAHA[1]
var DevilHP = HAHA[2]
let DevilAttack = HAHA[3]
let P = PS[0]
let S = PS[1]
var DevilHPTmp = DevilHP - P
var AttackCountH = DevilHPTmp / HeroAttack
var AttackCountD = HeroHP / DevilAttack

if DevilHPTmp == 0 {
    DevilHP -= HeroAttack
    if DevilHP <= 0 {
        print("Victory!")
        exit(0)
    }
    HeroHP -= DevilAttack
    if HeroHP <= 0 {
        print("gg")
        exit(0)
    }
    DevilHP += S
    AttackCountH = DevilHP / HeroAttack + (DevilHP % HeroAttack != 0 ? 1 : 0)
    AttackCountD = HeroHP / DevilAttack + (HeroHP % DevilAttack != 0 ? 1 : 0)
    if AttackCountH <= AttackCountD {
        print("Victory!")
        exit(0)
    } else {
        print("gg")
        exit(0)
    }
} else {
    if AttackCountH > AttackCountD {
        print("gg")
        exit(0)
    } else {
        DevilHP -= AttackCountH * HeroAttack
        HeroHP -= AttackCountH * DevilAttack
        if HeroHP <= 0 {
            print("gg")
            exit(0)
        }
        if DevilHP == P {
            DevilHP += S
            AttackCountH = DevilHP / HeroAttack + (DevilHP % HeroAttack != 0 ? 1 : 0)
            AttackCountD = HeroHP / DevilAttack + (HeroHP % DevilAttack != 0 ? 1 : 0)
            if AttackCountH <= AttackCountD {
                print("Victory!")
                exit(0)
            } else {
                print("gg")
                exit(0)
            }
        } else {
            DevilHP -= HeroAttack
            if DevilHP <= 0 {
                print("Victory!")
                exit(0)
            }
            HeroHP -= DevilAttack
            if HeroHP <= 0 {
                print("gg")
                exit(0)
            }
            if DevilHP < P {
                DevilHP += S
            }
            AttackCountH = DevilHP / HeroAttack + (DevilHP % HeroAttack != 0 ? 1 : 0)
            AttackCountD = HeroHP / DevilAttack + (HeroHP % DevilAttack != 0 ? 1 : 0)
            if AttackCountH <= AttackCountD {
                print("Victory!")
                exit(0)
            } else {
                print("gg")
                exit(0)
            }
        }
    }
}
