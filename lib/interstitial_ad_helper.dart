import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdHelper {
  InterstitialAd? _interstitialAd;
  bool _isLoaded = false;

  void loadAd({Function()? onLoaded}) {
    InterstitialAd.load(
      adUnitId:
          'ca-app-pub-3940256099942544/1033173712', // ID de prueba oficial
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isLoaded = true;
          onLoaded?.call();
        },
        onAdFailedToLoad: (error) {
          _isLoaded = false;
        },
      ),
    );
  }

  void showAd({required VoidCallback onAdClosed}) {
    if (_isLoaded && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _isLoaded = false;
          loadAd(); // Prepara el siguiente
          onAdClosed();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _isLoaded = false;
          loadAd();
          onAdClosed();
        },
      );
      _interstitialAd!.show();
    } else {
      onAdClosed();
    }
  }
}
