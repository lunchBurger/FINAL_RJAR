package com.rjar.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Champion {
   private String tier;
   private String lane;
   private String championName;
   private String champion_kr_name;
   private int championId;
   private double winRate1;
   private double winRate2;
   private double pickRate;
   private double banRate1;
   private double banRate2;
   private int champTier;
   private String counter1;
   private String counter2;
   private String counter3;
   private String counter4;
   private String counter5;
   private String counter6;
   private String counter7;
   private String counter8;
   private String counter9;
   private String counter10;
   
   private double kda1;
   private double kda2;
   private double damageDealt1;
   private double damageDealt2;
   private double killParticipation1;
   private double killParticipation2;
   private double vsWinRate;
   private int gameCount;
   private double counterWinRate;
   
   
   
}