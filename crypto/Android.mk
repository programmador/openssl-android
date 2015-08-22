LOCAL_PATH:= $(call my-dir)

arm_cflags := -DOPENSSL_BN_ASM_MONT -DAES_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM
arm_src_files := \
    aes/asm/aes-armv4.S \
    bn/asm/armv4-mont.S \
    sha/asm/sha1-armv4-large.S \
    sha/asm/sha256-armv4.S \
    sha/asm/sha512-armv4.S
non_arm_src_files := aes/aes_core.c

local_src_files := \
	cryptlib.c \
	mem.c \
	mem_clr.c \
	mem_dbg.c \
	cversion.c \
	ex_data.c \
	cpt_err.c \
	ebcdic.c \
	uid.c \
	o_time.c \
	o_str.c \
	o_dir.c \
	aes/aes_cbc.c \
	aes/aes_cfb.c \
	aes/aes_ctr.c \
	aes/aes_ecb.c \
	aes/aes_misc.c \
	aes/aes_ofb.c \
	aes/aes_wrap.c \
	asn1/a_bitstr.c \
	asn1/a_bool.c \
	asn1/a_bytes.c \
	asn1/a_d2i_fp.c \
	asn1/a_digest.c \
	asn1/a_dup.c \
	asn1/a_enum.c \
	asn1/a_gentm.c \
	asn1/a_i2d_fp.c \
	asn1/a_int.c \
	asn1/a_mbstr.c \
	asn1/a_object.c \
	asn1/a_octet.c \
	asn1/a_print.c \
	asn1/a_set.c \
	asn1/a_sign.c \
	asn1/a_strex.c \
	asn1/a_strnid.c \
	asn1/a_time.c \
	asn1/a_type.c \
	asn1/a_utctm.c \
	asn1/a_utf8.c \
	asn1/a_verify.c \
	asn1/ameth_lib.c \
	asn1/asn1_err.c \
	asn1/asn1_gen.c \
	asn1/asn1_lib.c \
	asn1/asn1_par.c \
	asn1/asn_mime.c \
	asn1/asn_moid.c \
	asn1/asn_pack.c \
	asn1/bio_asn1.c \
	asn1/bio_ndef.c \
	asn1/d2i_pr.c \
	asn1/d2i_pu.c \
	asn1/evp_asn1.c \
	asn1/f_enum.c \
	asn1/f_int.c \
	asn1/f_string.c \
	asn1/i2d_pr.c \
	asn1/i2d_pu.c \
	asn1/n_pkey.c \
	asn1/nsseq.c \
	asn1/p5_pbe.c \
	asn1/p5_pbev2.c \
	asn1/p8_pkey.c \
	asn1/t_bitst.c \
	asn1/t_crl.c \
	asn1/t_pkey.c \
	asn1/t_req.c \
	asn1/t_spki.c \
	asn1/t_x509.c \
	asn1/t_x509a.c \
	asn1/tasn_dec.c \
	asn1/tasn_enc.c \
	asn1/tasn_fre.c \
	asn1/tasn_new.c \
	asn1/tasn_prn.c \
	asn1/tasn_typ.c \
	asn1/tasn_utl.c \
	asn1/x_algor.c \
	asn1/x_attrib.c \
	asn1/x_bignum.c \
	asn1/x_crl.c \
	asn1/x_exten.c \
	asn1/x_info.c \
	asn1/x_long.c \
	asn1/x_name.c \
	asn1/x_nx509.c \
	asn1/x_pkey.c \
	asn1/x_pubkey.c \
	asn1/x_req.c \
	asn1/x_sig.c \
	asn1/x_spki.c \
	asn1/x_val.c \
	asn1/x_x509.c \
	asn1/x_x509a.c \
	bf/bf_cfb64.c \
	bf/bf_ecb.c \
	bf/bf_enc.c \
	bf/bf_ofb64.c \
	bf/bf_skey.c \
	bio/b_dump.c \
	bio/b_print.c \
	bio/b_sock.c \
	bio/bf_buff.c \
	bio/bf_nbio.c \
	bio/bf_null.c \
	bio/bio_cb.c \
	bio/bio_err.c \
	bio/bio_lib.c \
	bio/bss_acpt.c \
	bio/bss_bio.c \
	bio/bss_conn.c \
	bio/bss_dgram.c \
	bio/bss_fd.c \
	bio/bss_file.c \
	bio/bss_log.c \
	bio/bss_mem.c \
	bio/bss_null.c \
	bio/bss_sock.c \
	bn/bn_add.c \
	bn/bn_asm.c \
	bn/bn_blind.c \
	bn/bn_const.c \
	bn/bn_ctx.c \
	bn/bn_div.c \
	bn/bn_err.c \
	bn/bn_exp.c \
	bn/bn_exp2.c \
	bn/bn_gcd.c \
	bn/bn_gf2m.c \
	bn/bn_kron.c \
	bn/bn_lib.c \
	bn/bn_mod.c \
	bn/bn_mont.c \
	bn/bn_mpi.c \
	bn/bn_mul.c \
	bn/bn_nist.c \
	bn/bn_prime.c \
	bn/bn_print.c \
	bn/bn_rand.c \
	bn/bn_recp.c \
	bn/bn_shift.c \
	bn/bn_sqr.c \
	bn/bn_sqrt.c \
	bn/bn_word.c \
	buffer/buf_err.c \
	buffer/buffer.c \
	comp/c_rle.c \
	comp/c_zlib.c \
	comp/comp_err.c \
	comp/comp_lib.c \
	conf/conf_api.c \
	conf/conf_def.c \
	conf/conf_err.c \
	conf/conf_lib.c \
	conf/conf_mall.c \
	conf/conf_mod.c \
	conf/conf_sap.c \
	des/cbc_cksm.c \
	des/cbc_enc.c \
	des/cfb64ede.c \
	des/cfb64enc.c \
	des/cfb_enc.c \
	des/des_enc.c \
	des/des_old.c \
	des/des_old2.c \
	des/ecb3_enc.c \
	des/ecb_enc.c \
	des/ede_cbcm_enc.c \
	des/enc_read.c \
	des/enc_writ.c \
	des/fcrypt.c \
	des/fcrypt_b.c \
	des/ofb64ede.c \
	des/ofb64enc.c \
	des/ofb_enc.c \
	des/pcbc_enc.c \
	des/qud_cksm.c \
	des/rand_key.c \
	des/read2pwd.c \
	des/rpc_enc.c \
	des/set_key.c \
	des/str2key.c \
	des/xcbc_enc.c \
	dh/dh_ameth.c \
	dh/dh_asn1.c \
	dh/dh_check.c \
	dh/dh_depr.c \
	dh/dh_err.c \
	dh/dh_gen.c \
	dh/dh_key.c \
	dh/dh_lib.c \
	dh/dh_pmeth.c \
	dsa/dsa_ameth.c \
	dsa/dsa_asn1.c \
	dsa/dsa_depr.c \
	dsa/dsa_err.c \
	dsa/dsa_gen.c \
	dsa/dsa_key.c \
	dsa/dsa_lib.c \
	dsa/dsa_ossl.c \
	dsa/dsa_pmeth.c \
	dsa/dsa_prn.c \
	dsa/dsa_sign.c \
	dsa/dsa_vrf.c \
	dso/dso_dl.c \
	dso/dso_dlfcn.c \
	dso/dso_err.c \
	dso/dso_lib.c \
	dso/dso_null.c \
	dso/dso_openssl.c \
	ec/ec2_mult.c \
	ec/ec2_smpl.c \
	ec/ec_ameth.c \
	ec/ec_asn1.c \
	ec/ec_check.c \
	ec/ec_curve.c \
	ec/ec_cvt.c \
	ec/ec_err.c \
	ec/ec_key.c \
	ec/ec_lib.c \
	ec/ec_mult.c \
	ec/ec_pmeth.c \
	ec/ec_print.c \
	ec/eck_prn.c \
	ec/ecp_mont.c \
	ec/ecp_nist.c \
	ec/ecp_smpl.c \
	ecdh/ech_err.c \
	ecdh/ech_key.c \
	ecdh/ech_lib.c \
	ecdh/ech_ossl.c \
	ecdsa/ecs_asn1.c \
	ecdsa/ecs_err.c \
	ecdsa/ecs_lib.c \
	ecdsa/ecs_ossl.c \
	ecdsa/ecs_sign.c \
	ecdsa/ecs_vrf.c \
	engine/eng_all.c \
	engine/eng_cnf.c \
	engine/eng_ctrl.c \
	engine/eng_dyn.c \
	engine/eng_err.c \
	engine/eng_fat.c \
	engine/eng_init.c \
	engine/eng_lib.c \
	engine/eng_list.c \
	engine/eng_pkey.c \
	engine/eng_table.c \
	engine/tb_asnmth.c \
	engine/tb_cipher.c \
	engine/tb_dh.c \
	engine/tb_digest.c \
	engine/tb_dsa.c \
	engine/tb_ecdh.c \
	engine/tb_ecdsa.c \
	engine/tb_pkmeth.c \
	engine/tb_rand.c \
	engine/tb_rsa.c \
	engine/tb_store.c \
	err/err.c \
	err/err_all.c \
	err/err_prn.c \
	evp/bio_b64.c \
	evp/bio_enc.c \
	evp/bio_md.c \
	evp/bio_ok.c \
	evp/c_all.c \
	evp/c_allc.c \
	evp/c_alld.c \
	evp/digest.c \
	evp/e_aes.c \
	evp/e_bf.c \
	evp/e_des.c \
	evp/e_des3.c \
	evp/e_null.c \
	evp/e_old.c \
	evp/e_rc2.c \
	evp/e_rc4.c \
	evp/e_rc5.c \
	evp/e_xcbc_d.c \
	evp/encode.c \
	evp/evp_acnf.c \
	evp/evp_enc.c \
	evp/evp_err.c \
	evp/evp_key.c \
	evp/evp_lib.c \
	evp/evp_pbe.c \
	evp/evp_pkey.c \
	evp/m_dss.c \
	evp/m_dss1.c \
	evp/m_ecdsa.c \
	evp/m_md4.c \
	evp/m_md5.c \
	evp/m_mdc2.c \
	evp/m_null.c \
	evp/m_ripemd.c \
	evp/m_sha1.c \
	evp/m_sigver.c \
	evp/m_wp.c \
	evp/names.c \
	evp/p5_crpt.c \
	evp/p5_crpt2.c \
	evp/p_dec.c \
	evp/p_enc.c \
	evp/p_lib.c \
	evp/p_open.c \
	evp/p_seal.c \
	evp/p_sign.c \
	evp/p_verify.c \
	evp/pmeth_fn.c \
	evp/pmeth_gn.c \
	evp/pmeth_lib.c \
	hmac/hm_ameth.c \
	hmac/hm_pmeth.c \
	hmac/hmac.c \
	krb5/krb5_asn.c \
	lhash/lh_stats.c \
	lhash/lhash.c \
	md4/md4_dgst.c \
	md4/md4_one.c \
	md5/md5_dgst.c \
	md5/md5_one.c \
	modes/cbc128.c \
	modes/cfb128.c \
	modes/ctr128.c \
	modes/ofb128.c \
	objects/o_names.c \
	objects/obj_dat.c \
	objects/obj_err.c \
	objects/obj_lib.c \
	objects/obj_xref.c \
	ocsp/ocsp_asn.c \
	ocsp/ocsp_cl.c \
	ocsp/ocsp_err.c \
	ocsp/ocsp_ext.c \
	ocsp/ocsp_ht.c \
	ocsp/ocsp_lib.c \
	ocsp/ocsp_prn.c \
	ocsp/ocsp_srv.c \
	ocsp/ocsp_vfy.c \
	pem/pem_all.c \
	pem/pem_err.c \
	pem/pem_info.c \
	pem/pem_lib.c \
	pem/pem_oth.c \
	pem/pem_pk8.c \
	pem/pem_pkey.c \
	pem/pem_seal.c \
	pem/pem_sign.c \
	pem/pem_x509.c \
	pem/pem_xaux.c \
	pem/pvkfmt.c \
	pkcs12/p12_add.c \
	pkcs12/p12_asn.c \
	pkcs12/p12_attr.c \
	pkcs12/p12_crpt.c \
	pkcs12/p12_crt.c \
	pkcs12/p12_decr.c \
	pkcs12/p12_init.c \
	pkcs12/p12_key.c \
	pkcs12/p12_kiss.c \
	pkcs12/p12_mutl.c \
	pkcs12/p12_npas.c \
	pkcs12/p12_p8d.c \
	pkcs12/p12_p8e.c \
	pkcs12/p12_utl.c \
	pkcs12/pk12err.c \
	pkcs7/pk7_asn1.c \
	pkcs7/pk7_attr.c \
	pkcs7/pk7_doit.c \
	pkcs7/pk7_lib.c	\
	pkcs7/pk7_mime.c \
	pkcs7/pk7_smime.c \
	pkcs7/pkcs7err.c \
	rand/md_rand.c \
	rand/rand_egd.c \
	rand/rand_err.c \
	rand/rand_lib.c \
	rand/rand_unix.c \
	rand/randfile.c \
	rc2/rc2_cbc.c \
	rc2/rc2_ecb.c \
	rc2/rc2_skey.c \
	rc2/rc2cfb64.c \
	rc2/rc2ofb64.c \
	rc4/rc4_enc.c \
	rc4/rc4_skey.c \
	ripemd/rmd_dgst.c \
	ripemd/rmd_one.c \
	rsa/rsa_ameth.c \
	rsa/rsa_asn1.c \
	rsa/rsa_chk.c \
	rsa/rsa_eay.c \
	rsa/rsa_err.c \
	rsa/rsa_gen.c \
	rsa/rsa_lib.c \
	rsa/rsa_none.c \
	rsa/rsa_null.c \
	rsa/rsa_oaep.c \
	rsa/rsa_pk1.c \
	rsa/rsa_pmeth.c \
	rsa/rsa_prn.c \
	rsa/rsa_pss.c \
	rsa/rsa_saos.c \
	rsa/rsa_sign.c \
	rsa/rsa_ssl.c \
	rsa/rsa_x931.c \
	sha/sha1_one.c \
	sha/sha1dgst.c \
	sha/sha256.c \
	sha/sha512.c \
	sha/sha_dgst.c \
	stack/stack.c \
	ts/ts_err.c \
	txt_db/txt_db.c \
	ui/ui_compat.c \
	ui/ui_err.c \
	ui/ui_lib.c \
	ui/ui_openssl.c \
	ui/ui_util.c \
	x509/by_dir.c \
	x509/by_file.c \
	x509/x509_att.c \
	x509/x509_cmp.c \
	x509/x509_d2.c \
	x509/x509_def.c \
	x509/x509_err.c \
	x509/x509_ext.c \
	x509/x509_lu.c \
	x509/x509_obj.c \
	x509/x509_r2x.c \
	x509/x509_req.c \
	x509/x509_set.c \
	x509/x509_trs.c \
	x509/x509_txt.c \
	x509/x509_v3.c \
	x509/x509_vfy.c \
	x509/x509_vpm.c \
	x509/x509cset.c \
	x509/x509name.c \
	x509/x509rset.c \
	x509/x509spki.c \
	x509/x509type.c \
	x509/x_all.c \
	x509v3/pcy_cache.c \
	x509v3/pcy_data.c \
	x509v3/pcy_lib.c \
	x509v3/pcy_map.c \
	x509v3/pcy_node.c \
	x509v3/pcy_tree.c \
	x509v3/v3_akey.c \
	x509v3/v3_akeya.c \
	x509v3/v3_alt.c \
	x509v3/v3_bcons.c \
	x509v3/v3_bitst.c \
	x509v3/v3_conf.c \
	x509v3/v3_cpols.c \
	x509v3/v3_crld.c \
	x509v3/v3_enum.c \
	x509v3/v3_extku.c \
	x509v3/v3_genn.c \
	x509v3/v3_ia5.c \
	x509v3/v3_info.c \
	x509v3/v3_int.c \
	x509v3/v3_lib.c \
	x509v3/v3_ncons.c \
	x509v3/v3_ocsp.c \
	x509v3/v3_pci.c \
	x509v3/v3_pcia.c \
	x509v3/v3_pcons.c \
	x509v3/v3_pku.c \
	x509v3/v3_pmaps.c \
	x509v3/v3_prn.c \
	x509v3/v3_purp.c \
	x509v3/v3_skey.c \
	x509v3/v3_sxnet.c \
	x509v3/v3_utl.c \
	x509v3/v3err.c

local_c_includes := \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/asn1 \
	$(LOCAL_PATH)/evp \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../include/openssl

local_c_flags := -DNO_WINDOWS_BRAINDEATH

# SPECIAL CASES:
# 1) android-6 and android-7 are the same thing as android-5
# 2) android-10 .. 13 is the same thing as android-9
#
DETECTED_PLATFORM = $(TARGET_PLATFORM)
APP_PLATFORM_LEVEL := $(strip $(subst android-,,$(TARGET_PLATFORM)))
ifneq (,$(filter 6 7,$(APP_PLATFORM_LEVEL)))
    DETECTED_PLATFORM := android-5
    $(warning  Adjusting APP_PLATFORM android-$(APP_PLATFORM_LEVEL) to $(DETECTED_PLATFORM))
endif
ifneq (,$(filter 10 11 12 13,$(APP_PLATFORM_LEVEL)))
    DETECTED_PLATFORM := android-9
    $(warning Adjusting APP_PLATFORM android-$(APP_PLATFORM_LEVEL) to $(DETECTED_PLATFORM))
endif

ifeq ($(DETECTED_PLATFORM),android-5)
    local_c_flags += -DANDROID5
endif

#######################################
# target static library
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../android-config.mk

ifneq ($(TARGET_ARCH),x86)
LOCAL_NDK_VERSION := 5
LOCAL_SDK_VERSION := 9
endif

LOCAL_SRC_FILES += $(local_src_files)
LOCAL_CFLAGS += $(local_c_flags)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_LDLIBS += -lz
LOCAL_EXPORT_LDLIBS := -lz
ifeq ($(TARGET_ARCH),arm)
	LOCAL_SRC_FILES += $(arm_src_files)
	LOCAL_CFLAGS += $(arm_cflags)
else
	LOCAL_SRC_FILES += $(non_arm_src_files)
endif
ifeq ($(TARGET_SIMULATOR),true)
	# Make valgrind happy.
	LOCAL_CFLAGS += -DPURIFY
    LOCAL_LDLIBS += -ldl
>>>>>>> removed LOCAL_SHARED_LIBRARIES since that refers to the internal build
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libcrypto
include $(BUILD_SHARED_LIBRARY)

#######################################
# host shared library
ifeq ($(WITH_HOST_DALVIK),true)
    include $(CLEAR_VARS)
    include $(LOCAL_PATH)/../android-config.mk
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_CFLAGS += $(local_c_flags) -DPURIFY
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_SRC_FILES += $(non_arm_src_files)
    LOCAL_LDLIBS += -ldl
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libcrypto
    include $(BUILD_SHARED_LIBRARY)
endif

########################################
# host static library, which is used by some SDK tools.

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_CFLAGS += $(local_c_flags) -DPURIFY
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_SRC_FILES += $(non_arm_src_files)
LOCAL_LDLIBS += -ldl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libcrypto_static
include $(BUILD_STATIC_LIBRARY)
