package com.test.md5;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
 
public class Md5 {
    public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
//    public static String encode(String password)
//    {
//        byte[] uniqueKey = password.getBytes();
//        byte[] hash      = null;
//
//        try
//        {
//            hash = MessageDigest.getInstance("MD5").digest(uniqueKey);
//        }
//        catch (NoSuchAlgorithmException e)
//        {
//            throw new Error("No MD5 support in this VM.");
//        }
//
//        StringBuilder hashString = new StringBuilder();
//        for (int i = 0; i < hash.length; i++)
//        {
//            String hex = Integer.toHexString(hash[i]);
//            if (hex.length() == 1)
//            {
//                hashString.append('0');
//                hashString.append(hex.charAt(hex.length() - 1));
//            }
//            else
//                hashString.append(hex.substring(hex.length() - 2));
//        }
//        return hashString.toString();
//    }
    

}